# SISCONCED DOCKERIZED

## Este proyecto se creo para suplir la necesidad de superar el login de google con un certificado SSL.

---

## Dentro de este repo se encuentran dos carpetas una de ellas se llama **proyecto**, en esta carpeta se encuentran:

    - Los archivos originales del repo.
    - Dockerfile con todo el setup dentro de un solo contenedor.
    - El docker compose que se encarga de crear los demas contenedores necesarios para el deployment.
    - El archivo de configuracion de nginx.
---
## Nota
    - Se separo la logica del proyecto dentro de la carpeta webservices.

----------
#### Dentro de la carpeta webservices, se encuentran 3 carpetas en cada una de ellas se encuentra un Dockerfile,
#### este dockerfile hace alucion del servicio que presta.
----------
### Para ejecutar este proyecto, solo es necesario tener docker desktop o en su defecto docker engine.
### Descarga el proyecto sisconced original de dementesweb, dentro de la carpeta `/webservices/app/` 
### Para ejecutar este proyecto es necesario tener el proyecto sisconced procura hacer un git clone con el https del proyecto sisconced.
----------