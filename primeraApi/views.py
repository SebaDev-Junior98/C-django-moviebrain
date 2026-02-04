from django.shortcuts import render
from primeraApp.models import Pelicula, Genero,Recomendacion
from django.http import JsonResponse
from primeraApi.serializers import PeliculaSerializer
from primeraApi.serializers import GeneroSerializer
from primeraApi.serializers import RecomendacionSerializer
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view
# Create your views here.
@api_view(['GET','POST'])
def peliculasApi(request):
    peliculas = Pelicula.objects.all()
    data = {
        'peliculas':list(
            peliculas.values('titulo','generos','descripcion','puntuacion')
        )
    }

def pelicula_listado(request):
    if request == 'GET':
        peliculas = Pelicula.objects.all()
        serializer = PeliculaSerializer(peliculas,many=True)
        return Response(serializer.data)
    
    if  request == 'POST':
        serializer = PeliculaSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
        

@api_view(['GET','PUT','DELETE'])
def pelicula_detalle(request,pk):
    try:
        pelicula = Pelicula.objects.get(id=pk)
    except Pelicula.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = PeliculaSerializer(pelicula)
        return Response(serializer.data)

    if request.method == 'PUT':
        serializer = PeliculaSerializer(pelicula,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)
    if request.method == 'DELETE':
        pelicula.delete()
        return Response(status.HTTP_204_NO_CONTENT)
    


@api_view(['GET','POST'])
def generosApi(request):
    generos = Genero.objects.all()
    data = {
        'generos':list(
            generos.values('nombre_genero')
        )
    }
def genero_listado(request):
    if request == 'GET':
        generos = Genero.objects.all()
        serializer = GeneroSerializer(generos,many=True)
        return Response(serializer.data)
    
    if  request == 'POST':
        serializer = GeneroSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
        

@api_view(['GET','PUT','DELETE'])
def genero_detalle(request,pk):
    try:
        genero = Genero.objects.get(id=pk)
    except Genero.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = GeneroSerializer(genero)
        return Response(serializer.data)

    if request.method == 'PUT':
        serializer = GeneroSerializer(genero,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)
    if request.method == 'DELETE':
        genero.delete()
        return Response(status.HTTP_204_NO_CONTENT)
    



@api_view(['GET','POST'])

def recomendacionesApi(request):
    recomendaciones = Recomendacion.objects.all()
    data = {
        'generos':list(
            recomendaciones.values('nombre_genero')
        )
    }
def recomendacion_listado(request):
    if request == 'GET':
        recomendaciones = Recomendacion.objects.all()
        serializer = RecomendacionSerializer(recomendaciones,many=True)
        return Response(serializer.data)
    
    if  request == 'POST':
        serializer = RecomendacionSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status=status.HTTP_201_CREATED)
        return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
        

@api_view(['GET','PUT','DELETE'])
def recomendacion_detalle(request,pk):
    try:
        recomendacion = Recomendacion.objects.get(id=pk)
    except Recomendacion.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = RecomendacionSerializer(recomendacion)
        return Response(serializer.data)

    if request.method == 'PUT':
        serializer = RecomendacionSerializer(recomendacion,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors,status=status.HTTP_404_NOT_FOUND)
    if request.method == 'DELETE':
        recomendacion.delete()
        return Response(status.HTTP_204_NO_CONTENT)
