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

### Creando un menú de navegación

Vamos a crear un menú en la parte superior del navegador, que me va a servir para hacer navegación entre distintas pantallas.

Cosas a tener en cuenta:

- Tiene que reaccionar en base al URL
- En qué Widget vamos a colocar este menú

Vamos a empezar colocándolo en `counter_page.dart`, pero no debería estar ahí, porque la idea es que nuestro menú se redibuje solo cuando sea necesario.

Tiene que estar en un Widget aún más alto que nos permita no redibujar el menú, salvo que sea necesario. Y nuestra URL tiene que seguir funcionando.

Esto es un punto donde Flutter Web se siente diferente a la navegación tradicional, ya que en ella no hay que hacer nada de esto, porque se espera que toda la pantalla cambie.

Creamos en la carpeta `shared` el archivo `custom_app_menu.dart`.

Como hemos dicho, por ahora el menú lo vamos a situar en `counter_page.dart`. Aquí modificamos también para hacerlo responsive, usando el Widget `FittedBox`.

### Navegación tradicional en Flutter

Vamos a realizar una navegación tradicional, para ver los problemas que esto nos puede causar.

Nos creamos una nueva ruta en `main.dart`.

Tener en cuenta que si un usuario escribe una ruta inexistente deberíamos llevarlo bien al home o, mejor, a una página `404`.

Esto no suele hacer falta configurarlo en una app móvil porque los usuarios no pueden cambiar el URL. Pero en una app web si que pueden.

También modificamos `counter_page.dart` para añadir un nuevo texto y así saber en que URL estoy.

Creamos, en la carpeta `pages` el archivo `counter_provider_page.dart`.

Una vez modificado, hacemos un `full restart`.

Ahora, en el navegador, indicar la ruta `http://localhost:50045/#/provider`. Veremos que funciona, pero la navegación la hace rara, no es normal en un sitio web. Si volvemos a indicar `http://localhost:50045/#/stateful` sigue funcionando, pero, de nuevo, es una navegación que no se siente de web. También se pueden pulsar los botones de nuestro menú de navegación.

Vemos que si pulsamos el mismo botón de navegación (Contador Stateful) varias veces, vuelve a ir a esa página, cosa que no tiene sentido. Si estoy en una página no hace falta volver a ir a la misma página, salvo que vaya a la barra de URL y pulse Intro. Lo que hace Flutter Web tiene el problema de que crea muchos stacks de la pantalla.

Si pulso en el botón `Otra página`, vemos que no hace nada, y si en la URL escribo una ruta inexistente, como `http://localhost:50045/#/xxx` entonces automáticamente nos escribe `http://localhost:50045/#/stateful` de nuevo.

Si abro un nuevo navegador y escribo esta ruta `http://localhost:50045/#/stateful212` esto si falla.

Sin embargo, el problema principal es que no somos capaces de recibir segmentos en el URL. Esto, por ejemplo `http://localhost:50045/#/provider/12` no hace ni caso.

Tampoco funciona mandar query parameters. Esto, por ejemplo `http://localhost:50045/#/provider?q=batman` no hace ni caso tampoco. Vuelve a `http://localhost:50045/#/provider`.

Para poder hacer todo esto, Flutter ofrece para aplicaciones Web `Router Navigation 2.0`. Sin embargo, usarlo en muy complejo.

### Router Generator

NOTA: En la rama `bases_web_go_router` existe una versión de las rutas hecha con `go_router`.

Creamos una nueva carpeta en `lib` llamada `router`, y dentro creamos un archivo que se va a encargar del manejo de todas mis rutas `route_generator.dart`. Es una clase cuyos métodos son todos estáticos porque no quiero instanciar nada.

En `main.dart` vamos a trabajar con `onGenerateRoute`, que recibe la nueva clase creada. Sería de esta forma:

```dart
onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),

// Pero como el argumento es el mismo que se manda a la función, se puede acortar, mandando
// solo la referencia a la función.
onGenerateRoute: RouteGenerator.generateRoute,
```

Creamos también la página 404. En la carpeta `pages` creamos el archivo `page_404.dart`.

Vemos que la transición entre páginas sigue sin verse normal para una app web y que la URL no cambia al pulsar los enlaces. Siempre hace referencia a `http://localhost:50198/`.

### Transición entre páginas y URL

Para recuperar la url completa, modificamos `route_generator.dart` para trabajar con los `settings`.

Para el tema de la transición, modificamos también `route_generator.dart`, creando un nuevo método estático `_fadeRoute()`.

Con esto, cuando cambiamos la URL se produce un fade. Realmente en una web no hay fades, el cambio es abrupto. En esa función también indico como hacer que el cambio sea brusco.

Con esto, la app web funciona como queremos. Sin embargo, si vamos a un dispositivo móvil, veremos que la transición de página no se ve natural.

### Código específico para la web

Vamos a hacer un cambio para que se ajuste al dispositivo.

En una web dejaremos la transición tal cual la hemos hecho ya.

En un dispositivo móvil, haremos que la transición sea más fluida, la típica del móvil.

Vamos a modificar `route_generator.dart` para importar un objeto que nos sirve para saber si estamos en la web.

```dart
import 'package:flutter/foundation.dart' show kIsWeb;
```

Otra cosa que tenemos que arreglar: En nuestra barra de navegación, al pulsar un botón se está volviendo a reconstruir la barra de navegación. Esto NO debe suceder.

Tal y como está ahora, la parte del menú es parte de cada una de las páginas. Si vamos a `counter_page.dart` veremos que nuestro menú está incrustado, se llama directamente a `CustomAppMenu(),`.

Este `CustomAppMenu(),` no debe ser parte de `counter_page.dart`. Cuando cambiemos de pantalla solo debe cambiar el contenido de esa nueva pantalla. El menú de navegación NO debe cambiar.

Esto lo vamos a ir haciendo en los siguientes puntos.

### CounterProviderPage - Implementar Provider

Vamos a hacer que nuestra pantalla `counter_provider_page.dart` realmente trabaje con `Provider` y no con un Stateful Widget.

Instalamos la dependencia `provider` usando `PubSpec Assist`.

Modificamos `counter_provider_page.dart` para devolverlo a un Stateless Widget y usar provider para gestionar el estado solo de esta pantalla.

Creamos a nivel raiz la carpeta `providers` y dentro creamos el archivo `counter_provider.dart`. Los providers son una clase que permite a Flutter poderse redibujar cuando se notifica a los listeners.

### Layout Pages y Views

Para solucionar el problema de la recarga de toda la app, incluyendo el menú de navegación cada vez que se cambia de página, tenemos que hacer varios pasos.

- Pensar que tenemos que trabajar en base a views y layouts en lugar de páginas
  - Nuestro router solo debe devolver la vista (todo menos el menú de navegación) en vez de toda la pantalla
  - Un layout en un concepto, pero podemos verlo como un Widget que se encarga de renderizar cierta información específica
  - Vamos a transformar nuestras páginas en views

En la carpeta `ui` creamos la carpeta `layout` y dentro el archivo `main_layout_page.dart`.

La diferencia entre los layouts y los views es que los layouts contienen un Scaffold, es decir, son el contenido de la página. Se pueden mostrar por sí solos. Un view no tiene un Scaffold y es un Widget que depende de otro Widget que tenga el Scaffold para colocarlo donde deba.

En vez de transformar nuestras páginas en views, vamos a dejar la carpeta `pages` como referencia, aunque no se van a usar.

En la carpeta `ui` creamos la carpeta `views`. Copiamos el contenido de la carpeta` pages` a la carpeta `views`. Cambiamos los nombres a los siguientes:

- counter_view.dart
- counter_provider_view.dart
- view_404.dart

Y los modificamos para, entre otras cosas, quitarles el Scaffold.
