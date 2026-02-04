from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator
import os
import datetime
#Crear la Clase Genero
class Genero(models.Model):
    nombre_genero = models.CharField(
        max_length=200,
        verbose_name="Nombre del género"
    )
    creado = models.DateTimeField(default=timezone.now,editable=False)

    def __str__(self):
        return self.nombre_genero

    class Meta:
        db_table = 'genero'
        verbose_name = 'Género'
        verbose_name_plural = 'Géneros'
        ordering = ['nombre_genero']

#Crear la Clase Pelicula
class Pelicula(models.Model):
    titulo = models.CharField(
        max_length=100,
        verbose_name="Título de la película"
    )
    generos = models.ForeignKey(Genero,null=False,on_delete=models.CASCADE,
        verbose_name="Género"
    )
    anio = models.IntegerField(
        blank=True,
        null=True,
        verbose_name="Año de la película"
    )
    descripcion = models.CharField(
        max_length=200,
        verbose_name="Descripción"
    )
    puntuacion = models.PositiveIntegerField(
        default=10,
        verbose_name="Puntuación"
    )
    creado = models.DateTimeField(default=timezone.now,editable=False)


    def generarNombre(instance,filename):
        extension = os.path.splitext(filename)[1][1:]
        ruta = 'listar_peliculas'
        fecha = timezone.now().strftime("%d%m%Y_%H%M%S")
        nombre = "{}.{}".format(fecha,extension)
        return os.path.join(ruta,nombre)
    foto = models.ImageField(upload_to=generarNombre,null=True,default="listar_peliculas/pelicula.png")
    

    def __str__(self):
        return f"{self.titulo} ({self.generos})"

    class Meta:
        db_table = 'pelicula'
        verbose_name = 'Película'
        verbose_name_plural = 'Películas'
        ordering = ['titulo']



#Crear la Clase Recomendaciones
class Recomendacion(models.Model):
    usuario = models.ForeignKey(
        User,
        on_delete=models.CASCADE,
        verbose_name="Usuario"
    )
    peliculas = models.ForeignKey(
        Pelicula,null=False,on_delete=models.CASCADE,
        verbose_name="Películas recomendadas"
    )
    fecha = models.DateTimeField(
        verbose_name="Fecha de recomendación",auto_now_add=True,
    )

    def __str__(self):
        return f"Recomendación de {self.usuario.username}"

    class Meta:
        verbose_name = "Recomendación"
        verbose_name_plural = "Recomendaciones"
        ordering = ['-fecha']



#Crear la clase Calificacion
class Calificacion(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    puntuacion = models.PositiveIntegerField(
        validators=[
            MinValueValidator(1),
            MaxValueValidator(10)
        ]
    )
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Calificación de {self.usuario.username}: {self.puntuacion}"

    class Meta:
        db_table = 'calificacion'
        verbose_name = 'Calificacion'
        verbose_name_plural = 'Calificaciones'

#Crear la clase Comentario

class Comentario(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    texto = models.TextField()
    fecha = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.texto
    
    class Meta:
        db_table = 'comentario'
        verbose_name = 'Comentario'
        verbose_name_plural = 'Comentarios'
        ordering = ['-fecha']