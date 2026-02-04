from django.contrib import admin
from django.urls import path,include
from primeraApp import views as vista
from django.contrib.auth import views as auth_views
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from primeraApi import views as vistasApi

urlpatterns = [
    path('admin/', admin.site.urls),
    path("",vista.inicio,name="inicio"),
    path("agregar_pelicula/",vista.agregar_pelicula,name="agregar_pelicula"),
    path("listar_peliculas/",vista.listar_peliculas,name="listar_peliculas"),
    path("agregar_genero/",vista.agregar_generos,name="agregar_genero"),
    path("listar_generos/",vista.listar_generos,name="listar_generos"),
    path("listar_recomendaciones/",vista.listar_recomendaciones,name="listar_recomendaciones"),
    path("register/",vista.registrarse,name="register"),
    path("peliculaEdit/<int:pelicula_id>/",vista.cargar_editar_pelicula,name="editarPelicula"),
    path("peliculaEditado/<int:pelicula_id>/",vista.editar_pelicula,name="peliculaEditado"),
    path("generoEdit/<int:genero_id>/",vista.cargar_editar_generos,name="editarGenero"),
    path("generoEditado/<int:genero_id>/",vista.editar_genero,name="generoEditado"),
    path("peliculaDel/<int:pelicula_id>/",vista.eliminar_pelicula,name="eliminarPelicula"),
    path("generoDel/<int:genero_id>/",vista.eliminar_genero,name="eliminarGenero"),
    path("agregar_recomendacion/",vista.agregar_recomendacion,name="agregar_recomendacion"),
    path('accounts/',include('django.contrib.auth.urls')),
    path('recuperar-password/',auth_views.PasswordResetView.as_view(template_name='registration/recuperar_password.html'),name='password_reset'),
    path('recuperar-password/enviado/',auth_views.PasswordResetDoneView.as_view(template_name='registration/password_reset_done.html'),name='password_reset_done'),
    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(template_name='registration/password_reset_confirm.html'),name='password_reset_confirm'),
    path('reset/completado/',auth_views.PasswordResetCompleteView.as_view(template_name='registration/password_reset_complete.html'),name='password_reset_complete'),
    path('peliculasApi/',vistasApi.peliculasApi,name='peliculasApi'),
    path('peliculasListApi/',vistasApi.pelicula_listado,name='peliculasListApi'),
    path('peliculasListApi/<int:pk>',vistasApi.pelicula_detalle,name='peliculaDetalleApi'),
    path('generosApi/',vistasApi.generosApi,name='generosApi'),
    path('generosListApi/',vistasApi.genero_listado,name='generosListApi'),
    path('generosListApi/<int:pk>',vistasApi.genero_detalle,name='generoDetalleApi'),
    path('recomendacionesApi/',vistasApi.recomendacionesApi,name='recomendacionesApi'),
    path('recomendacionesListApi/',vistasApi.recomendacion_listado,name='recomendacionesListApi'),
    path('recomendacionesListApi/<int:pk>',vistasApi.recomendacion_detalle,name='recomendacionDetalleApi'),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)