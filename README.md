# FLUTTER WEB

Curso de Fernando Herrera: `https://cursos.devtalles.com/courses/flutter-web`

## Flutter Web - Introducción

### Temas puntuales de la sección

Esta es una sección introductoria, la cual tiene por objetivo hablar sobre:

- Consideraciones importantes sobre Flutter Web
- ¿Qué puede hacer y qué cosas no?
- Material adicional para seguir expandiendo el conocimiento
- Un exponente fuerte que utiliza Flutter Web
- Pros y contras

La idea es que antes de comenzar, tengan un panorama general del poder y limitantes de Flutter Web.

### Consideraciones importantes

- PROS
  - Excelente control sobre cada pixel de la pantalla
  - Misma base de código para IOS, Android, Web, Desktop (pequeñas diferencias)
  - Aumento de paquetes en Pub.dev
  - PWA al abrirlo de la caja con Network with Caché fallback
  - SPAs
  - Rendimiento óptimo para móviles y escritorio
- CONS
  - Contenido estático (Blogs, e-commerce, etc)
  - No SEO friendly, solo SPAs por el momento
  - Bundle size bastante pesado para la web
  - Eventualmente puede ser algo frustrante realizar tareas simples en Flutter Web
  - Manejo de rutas por URL es complicado (go_router elimina este Cons)

Esto puede haber cambiado a mejor (o peor ;D)

¿Por qué estudiar Flutter Web? 

- Puede hacer cosas que en otras tecnologías toma mucho tiempo o no hay forma de hacerlo fácilmente
- Si tienes una aplicación hecha en Flutter, ya tienes una aplicación Web (con excepciones)

### Recursos adicionales de Flutter Web antes de comenzar

- https://flutter.dev/multi-platform/web
- https://code.irobot.com/#/
  - Todo está hecho en Flutter
- presentacion.pdf

## Primeros pasos en Flutter Web

Algo en lo que tenemos que pensar cuando hacemos aplicaciones Web (en vez de aplicaciones móviles) con Flutter es en la navegación entre distintas rutas.

En aplicaciones móviles, como el usuario no tiene acceso al URL, no puede cambiarlo para navegar a una ruta en específico.

En una aplicación Web, el usuario podría, en una URL en concreto, guardarla en favoritos y, pasados x días, pulsar en ese link de favoritos y acceder a ese pantalla.

También por los URLs podemos mandar segmentos dinámicos, como ids de productos..., y query parameters.

### Temas puntuales de la sección

Esta es quizá la sección más importante del curso (junto con la siguiente), ¿Por qué? porque aquí veremos cómo manejar las rutas en Flutter Web, este punto es crucial para diferenciar una aplicación web de una aplicación móvil que se siente que fue porteada a la web.

Es importante aprender cómo manejar las rutas en Flutter, lo cual después nos permitirá añadir segmentos, query parameters y protección de rutas, ya que a diferencia de las aplicaciones móviles, el usuario puede manualmente llegar a las rutas de nuestra aplicación si las conoce (o las guarda como favoritos).

Aquí tendremos nuestros primeros pasos en la navegación de Flutter.

### Inicio de proyecto - Bases de Flutter Web

Todo lo que aprendamos aquí nos va a servir para Flutter en general, es decir, aplicaciones móviles, web y de escritorio.

Pero vamos a hacer aplicaciones web, que se sienten que son web, no portadas.

- Creamos un nuevo proyecto Flutter
  - Pulsamos `Cmd+Shift+P` y escribimos `Flutter: New Project`
  - Seleccionamos `Application`
  - Seleccionamos la carpeta donde queremos guardar el proyecto
  - Indicamos el nombre de la aplicación: `bases_web`
- Ejecutamos la aplicación
  - Pulsamos `Cmd+Shift+P` y escribimos `Flutter: Select Device`
  - Seleccionamos `Chrome`
  - Viendo el fuente `main.dart`, pulsar `F5`
    - Esto compila y genera la versión de desarrollo (no la final, que se crea al hacer el build) para web, con ciertos paquetes adicionales que nos permite hacer el hot reload, hot restart y ver los cambios en tiempo real

### Página de contador con Stateful Widget

Borramos todo el código de `main.dart` y, para generarlo de nuevo, escribimos el snippet `mateapp`.

En la carpeta `lib` creamos la carpeta `ui`.

Dentro de la carpeta `ui` creamos las carpetas `pages` y `shared`.

Dentro de la carpeta `pages` creamos el archivo `counter_page.dart`.

En `main.dart` indico la ruta de nuestro recién creado `CounterPage`.

Al crear la ruta:

```dart
  initialRoute: '/stateful',
  routes: {
    '/stateful': ( _ ) => CounterPage()
  },
```

Se indica `'/stateful'`. Si no ponemos la barra `/` entonces la URL se ve `/#stateful`. Con la barra se ve `/#/stateful`.

### Reutilización de Widgets

Modificamos `counter_page.dart` para añadir estilos al botón.

Si queremos reutilizar el botón más de una vez, lo mejor es separar ese Widget en un archivo independiente y pasar únicamente los argumentos que realmente vamos a necesitar. Con esto creamos un Widget personalizado.

Una forma muy rápida de conseguir esto es posicionarnos en el texto `TextButton`, pulsar `Cmd+.` y seleccionar `Extract Widget`. Le damos el nombre `CustomFlatButton`. Si, por lo que sea no deja hacerlo, entonces toca hacerlo a mano.

Si el botón solo se va a usar en `CounterPage` entonces, dentro de `pages` podría crear una carpeta `counter_page` y ponerlo ahí.

Pero como el botón va a ser usado por toda la aplicación entonces, dentro de la carpeta `shared` creamos un nuevo archivo llamado `custom_flat_button.dart` y me llevo el trozo de código correspondiente al `TextButton`, salvo la parte de tratamiento del estado, que lo paso por argumento, al igual que el texto que debe verse en el botón.

Con esto, para tener dos botones, solo tengo que llamar a `CustomFlatButton()` dos veces, pasando los argumentos que necesito.
