# API Test Automation Backend - Karate DSL

Proyecto de automatización de pruebas API basado en Karate DSL.

## Estructura del proyecto

[![estructura-karate-petstore.png](https://i.postimg.cc/NjcSSdvj/estructura-karate-petstore.png)](https://postimg.cc/crFF8MJp)

## Requerimientos generales

- Instalar algún cliente git como por ejemplo [git bash](https://git-scm.com/downloads) 

Descargar e instalar

- Java Development Kit 17 [(JDK)](https://www.oracle.com/java/technologies/downloads/#jdk17-windows)
    - Asegurarse de tener configurada la variable de entorno JAVA_HOME con la ruta de la JDK respectiva.
    - En caso de tener otra versión anterior de la JDK, para que funcione el proyecto se deberá actualizar en el archivo pom.xml la propiedad java.version.

- Maven [(Maven)](https://maven.apache.org/download.cgi)
    - Asegurarse de tener configurada la variable de entorno M2_HOME o PATH con la ruta de la Maven respectiva.

## Instalacion y funcionamiento

Clonar el repositorio:

    git clone git@github.com:NHLGuerrero/aut-backend-karatedsl-petstore.git

Ejecución de tests

    mvn clean verify -D karate.env=qa -D test=PetstoreRunner

Ejecución por tag (Agregar el tag @run a el/los casos de prueba a ejecutar).

    mvn clean verify -D karate.env=qa -D karate.options="--tags @run" -D test=PetstoreRunner

## Reportes

- Karate por defecto cuenta con una capa integrada de resultados de los test.

- Luego de cada ejecución se genera dentro de la carpeta target/karate-reports los reportes en formato html.

## Enlaces para mas informacion

- Documentación Karate: https://github.com/karatelabs/karate

- API utilizada: https://petstore.swagger.io/#/
