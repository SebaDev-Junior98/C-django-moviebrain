from django import forms
from primeraApp.choices import generos
from primeraApp.models import Pelicula, Genero, Recomendacion,Comentario,Calificacion
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

class GeneroForm(forms.ModelForm):
    nombre_genero = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder':'Ingrese el nombre del genero de la pelicula'}))


    class Meta:
        model = Genero
        fields = '__all__'

    def clean_nombre_genero(self):
        nombre_genero = self.cleaned_data.get("nombre_genero")

        
        if nombre_genero and not all(x.isalpha() or x.isspace() for x in nombre_genero):
            raise forms.ValidationError("Solo se permiten letras y espacios.")


class PeliculaForm(forms.ModelForm):

    titulo = forms.CharField(
        widget=forms.TextInput(attrs={
            'class': 'form-control',
            'placeholder': 'Ingrese el título de la película'
        })
    )

    generos = forms.ModelChoiceField(
        queryset=Genero.objects.all(),
        empty_label='Seleccione el género de la película',
        widget=forms.Select(attrs={'class': 'form-select'})
    )

    anio = forms.IntegerField(
        widget=forms.NumberInput(attrs={
            'class': 'form-control',
            'placeholder': 'Ingrese el año de la película'
        })
    )

    descripcion = forms.CharField(
        widget=forms.Textarea(attrs={
            'class': 'form-control',
            'placeholder': 'Ingrese la descripción de la película'
        })
    )

    puntuacion = forms.IntegerField(
        widget=forms.NumberInput(attrs={
            'class': 'form-control',
            'placeholder': 'Ingrese la puntuación'
        })
    )

    class Meta:
        model = Pelicula
        fields = '__all__'
    def clean_titulo(self):
        titulo = self.cleaned_data.get("titulo")

        
        if titulo and not all(x.isalpha() or x.isspace() for x in titulo):
            raise forms.ValidationError("Solo se permiten letras y espacios.")
        
        return titulo
    
    def clean_puntuacion(self):
        puntuacion = self.cleaned_data.get("puntuacion")

        if puntuacion:
            try:
                puntuacion = int(puntuacion)
            except ValueError:
                raise forms.ValidationError("La puntuacion debe ser un numero entero.")

   
        if puntuacion > 10:
            raise forms.ValidationError("La puntuacion de la pelicula es de 0 a 10.")

    
        return puntuacion






class RecomendacionForm(forms.ModelForm):

    peliculas = forms.ModelChoiceField(
    queryset=Pelicula.objects.all(),
    empty_label='Seleccione la pelicula',
    widget= forms.Select(attrs={'class':'form-select'})
    )
  


   
    class Meta:
        model = Recomendacion
        fields = ['peliculas']




class ComentarioForm(forms.ModelForm):
    class Meta:
        model = Comentario
        fields = ['texto']
        widgets = {
            'texto': forms.Textarea(attrs={
                'class': 'form-control',
                'rows': 3
            })
        }



class CalificacionForm(forms.ModelForm):
    class Meta:
        model = Calificacion
        fields = ['puntuacion']
        widgets = {
            'puntuacion': forms.NumberInput(attrs={
                'class': 'form-control w-25 mx-auto',
                'min': 1,
                'max': 10
            })
        }





class CambiarPasswordForm(forms.Form):
    password1 = forms.CharField(
        label="Ingrese la contraseña nueva",
        widget=forms.PasswordInput(attrs={'placeholder': '*************'})
    )
    password2 = forms.CharField(
        label="Repita la contraseña nueva",
        widget=forms.PasswordInput(attrs={'placeholder': '*************'})
    )

    def clean(self):
        cleaned_data = super().clean()
        p1 = cleaned_data.get("password1")
        p2 = cleaned_data.get("password2")

        if p1 and p2 and p1 != p2:
            raise forms.ValidationError("Las contraseñas no coinciden")

        return cleaned_data


class RegistroForm(UserCreationForm):
    email = forms.EmailField(required=True)

    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')