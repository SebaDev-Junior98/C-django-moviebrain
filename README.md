# 💻 Sistema de gestión y recomendación de películas

Aplicación web desarrollada con Django que permite gestionar películas y personalizar el contenido según el perfil del usuario (infantil o adulto).

---

## 🚀 Funcionalidades principales

- Sistema de autenticación completo (registro, login y recuperación de contraseña)
- Hash seguro de contraseñas
- Gestión de usuarios con roles y permisos según tipo de perfil
- CRUD completo de películas, comentarios y calificaciones
- Dashboard con métricas (total de datos por módulo)
- Sistema de recomendaciones según tipo de usuario
- API REST con Django REST Framework para integración con aplicaciones externas

---

## 🛠️ Tecnologías utilizadas

- Python  
- Django  
- Django REST Framework  
- HTML, CSS, Bootstrap  
- MySQL  
- Apache  

---

## 📌 Características destacadas

- Control de acceso mediante autenticación obligatoria
- Separación de funcionalidades según tipo de usuario
- Integración backend + frontend
- Arquitectura basada en el patrón MVT (Django)

---

## ▶️ Cómo ejecutar el proyecto

```bash
# Clonar repositorio
git clone https://github.com/SebaDev-Junior98/C-django-moviebrain.git

# Entrar al proyecto
cd moviebrain

# Crear entorno virtual
python -m venv env

# Activar entorno
source env/bin/activate  # Windows: env\Scripts\activate

# Instalar dependencias
pip install -r dependencias.txt

# Ejecutar servidor
python manage.py runserver
