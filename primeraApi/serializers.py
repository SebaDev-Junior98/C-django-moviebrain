from rest_framework import serializers
from primeraApp.models import Pelicula,Genero,Recomendacion
class PeliculaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pelicula
        fields = '__all__'
        

class GeneroSerializer(serializers.ModelSerializer):
    class Meta:
        model = Genero
        fields  = '__all__'


class RecomendacionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Recomendacion
        fields = 'peliculas'