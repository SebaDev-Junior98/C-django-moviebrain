from django.shortcuts import render,redirect,get_object_or_404
from primeraApp.forms import PeliculaForm, GeneroForm,RecomendacionForm,ComentarioForm,CalificacionForm,RegistroForm
from primeraApp.models import Pelicula, Recomendacion, Genero, Comentario, Calificacion
from django.contrib.auth.decorators import login_required
from django.db.models import Avg
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import permission_required
# Create your views here.
def inicio(request):
    total_peliculas = Pelicula.objects.count()
    total_recomendaciones = Recomendacion.objects.count()

    promedio = Calificacion.objects.aggregate(
        promedio=Avg('puntuacion')
    )['promedio']

    promedio = round(promedio, 1) if promedio else 0

    if request.method == 'POST':
        if 'calificacion_submit' in request.POST:
            form_calificacion = CalificacionForm(request.POST)
            if form_calificacion.is_valid():
                calificacion = form_calificacion.save(commit=False)
                calificacion.usuario = request.user
                calificacion.save()
                return redirect('inicio')
        elif 'comentario_submit' in request.POST:
            form_comentario = ComentarioForm(request.POST)
            if form_comentario.is_valid():
                comentario = form_comentario.save(commit=False)
                comentario.usuario = request.user
                comentario.save()
                return redirect('inicio')
    else:
        form_calificacion = CalificacionForm()
        form_comentario = ComentarioForm()

    comentarios = Comentario.objects.all().order_by('-id')

    return render(request, 'primeraApp/inicio.html', {
        'total_peliculas': total_peliculas,
        'total_recomendaciones': total_recomendaciones,
        'form_calificacion': form_calificacion,
        'form_comentario': form_comentario,
        'comentarios': comentarios,
        'promedio': promedio
    })



@permission_required('primeraApp.add_pelicula',raise_exception=True)
def agregar_pelicula(request):
    if request.method  == 'POST':
        form = PeliculaForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('listar_peliculas')
    else:
        form = PeliculaForm()
    return render(
    request,
    "primeraApp/agregar_pelicula.html",
    {
        "abrir_modal": True,
        "form": form
    }
)

def cargar_editar_pelicula(request,pelicula_id):
    pelicula = get_object_or_404(Pelicula,id=pelicula_id)
    form = PeliculaForm(instance=pelicula)

    return render(request,"primeraApp/peliculaEdit.html",{"form":form,"abrir_modal":True,"pelicula":pelicula})

@login_required
def editar_pelicula(request,pelicula_id):
    pelicula = get_object_or_404(Pelicula,id=pelicula_id)

    if request.method == 'POST':
        form  = PeliculaForm(request.POST,request.FILES,instance=pelicula)
        if form.is_valid():
            if 'foto' in request.FILES:
                pelicula.foto = request.FILES['foto']
            form.save()
            return redirect('/listar_peliculas/')
    else:
        form = PeliculaForm(instance=pelicula)
    return render(request,'primeraApp/listado_peliculas.html',{"form":form})


def eliminar_pelicula(request,pelicula_id):
    if not request.user.has_perm('primeraApp.delete_pelicula'):
        raise PermissionDenied  
    pelicula = get_object_or_404(Pelicula,id=pelicula_id)

    if request.method == 'POST':
        pelicula.delete()
        return redirect('/listar_peliculas/')
    return render(request,'primeraApp/peliculaDel.html',{"pelicula" : pelicula})

@permission_required('primeraApp.view_pelicula',raise_exception=True)
def listar_peliculas(request):
    search_query = request.GET.get('search', '')  
    if search_query:
      
        peliculas = Pelicula.objects.filter(titulo__icontains=search_query)
    else:
        peliculas = Pelicula.objects.all()
        

    data = {
        'peliculas':peliculas,
        "abrir_modal": True
    }
    return render(request,"primeraApp/listado_peliculas.html",data)

@permission_required('primeraApp.add_genero',raise_exception=True)
def agregar_generos(request):
    if request.method == 'POST':
        form = GeneroForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("primeraApp/listar_generos.html")
    else:
        form = GeneroForm
    return render(request,"primeraApp/agregar_genero.html",{"abrir_modal": True,"form":form})


def cargar_editar_generos(request,genero_id):
    genero = get_object_or_404(Genero,id=genero_id)
    form = GeneroForm(instance=genero)
    return render(request,"primeraApp/generoEdit.html",{"form":form,"abrir_modal":True,"genero":genero})
@login_required
def editar_genero(request,genero_id):
    genero = get_object_or_404(Genero,id=genero_id)

    if request.method == 'POST':
        form = GeneroForm(request.POST,instance=genero)
        if form.is_valid():
            form.save()
            return redirect('/listar_generos/')
    else:
        form  = GeneroForm(instance=genero)
    
    return render(request,"primeraApp/listar_generos.html",{"form":form})

@login_required
def eliminar_genero(request,genero_id):
    if not request.user.has_perm('primeraApp.delete_genero'):
        raise PermissionDenied  
    genero = get_object_or_404(Genero,id=genero_id)

    if request.method == 'POST':
        genero.delete()
        return redirect('/listar_generos/')
    return render(request,'primeraApp/generoDel.html',{"genero":genero})


@permission_required('primeraApp.view_genero',raise_exception=True)
@login_required
def listar_generos(request):
    search_query = request.GET.get('search', '')  
    if search_query:
      
        generos = Genero.objects.filter(nombre_genero__icontains=search_query)
    else:
        generos = Genero.objects.all()
    data = {
        'generos':generos,
        "abrir_modal": True
    }
    return render(request,"primeraApp/listar_generos.html",data)


@permission_required('primeraApp.add_recomendacion',raise_exception=True)
@login_required
def agregar_recomendacion(request):
    if request.method == 'POST':
        form = RecomendacionForm(request.POST)
        if form.is_valid():
            recomendacion = form.save(commit=False)  # 🔥 clave
            recomendacion.usuario = request.user     # 🔥 obligatorio
            recomendacion.save()
            return redirect('listar_recomendaciones')
    else:
        form = RecomendacionForm()

    return render(
        request,
        "primeraApp/agregar_recomendacion.html",
        {
            "abrir_modal": True,
            "form": form
        }
    )
@permission_required('primeraApp.view_recomendacion',raise_exception=True)
def listar_recomendaciones(request):
    recomendaciones = Recomendacion.objects.select_related('peliculas', 'usuario')

    data = {
        'recomendaciones': recomendaciones,
        "abrir_modal":True
    }

    return render(
        request,
        "primeraApp/listar_recomendacion.html",
        data
    )

def registrarse(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = RegistroForm()

    return render(request, 'registration/registrarse.html', {'form': form})

