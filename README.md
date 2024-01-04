# CRUD bancos y proveedores

Descripción detallada y propósito del proyecto.

## Requisitos Previos

Asegúrate de tener instalados los siguientes requisitos:

- [Ruby](https://www.ruby-lang.org/es/documentation/installation/)
- [Rails](https://rubyonrails.org/)

## Configuración del Proyecto

1. **Clonar el Repositorio:**

    ```bash
    git clone https://github.com/EDEA327/crud_bancos_PT.git
    ```

2. **Instalar Dependencias:**

    ```bash
    cd tu_proyecto
    bundle install
    ```

3. **Configurar la Base de Datos:**

    ```bash
    rails db:create
    rails db:migrate
    ```

    También puedes añadir comandos adicionales de configuración aquí...

## Puesta en Marcha

1. **Ejecutar el Servidor:**

    ```bash
    rails server
    ```

2. Visita [http://localhost:3000](http://localhost:3000) en tu navegador.

## Características Principales

Este proyecto presenta las siguientes características clave:

1. **CRUD de Bancos:**
   - Crear, Leer, Actualizar y Eliminar (CRUD) bancos.
   - Detalles incluyen el nombre del banco.

2. **CRUD de Proveedores:**
   - CRUD de proveedores con información como nombre, NIT, contacto, teléfono y cuenta bancaria.

3. **Sistema de Inicio de Sesión:**
   - Funcionalidad de inicio de sesión para usuarios.
   - Acceso seguro a las funcionalidades del CRUD.

4. **Interfaz de Usuario Intuitiva:**
   - Diseño fácil de usar y navegación fluida.
   - Interfaz clara para la gestión de bancos y proveedores.

5. **Gestión de Sesiones:**
   - Sesiones de usuario gestionadas de forma segura.

6. **Localización:**
   - Internacionalización (I18n) implementada para ofrecer soporte en varios idiomas.

7. **Paginación:**
   - Paginación implementada para una experiencia de usuario mejorada.

## Estructura del Proyecto

Describe la estructura de directorios y archivos más importante del proyecto.

## Tecnologías Utilizadas

- Ruby on Rails
- Bootstrap
