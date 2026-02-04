from django.contrib import admin
from primeraApp.models import Genero,Pelicula,Recomendacion,Calificacion,Comentario
# Register your models here.
class GeneroAdmin(admin.ModelAdmin):
    list_display = ['id','nombre_genero']

class PeliculaAdmin(admin.ModelAdmin):
    list_display = ['id','titulo','generos','anio','descripcion','puntuacion']

class CalificacionAdmin(admin.ModelAdmin):
    list_display = ['id','puntuacion','fecha']

class RecomendacionAdmin(admin.ModelAdmin):
    list_display = ['id', 'peliculas', 'usuario', 'fecha']
    exclude = ('usuario',)  

    def save_model(self, request, obj, form, change):
        if not change:  
            obj.usuario = request.user
        super().save_model(request, obj, form, change)

class ComentarioAdmin(admin.ModelAdmin):
    list_display = ['id','texto','fecha']


admin.site.register(Genero,GeneroAdmin)
admin.site.register(Pelicula,PeliculaAdmin)
admin.site.register(Recomendacion,RecomendacionAdmin)
admin.site.register(Calificacion,CalificacionAdmin)
admin.site.register(Comentario,ComentarioAdmin)

