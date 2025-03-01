# FLUTTER WEB

Curso de Fernando Herrera: `https://cursos.devtalles.com/courses/flutter-web`

## Orden de los proyectos

- bases_web
- bases_web_segmentos_query
- vertical_landing_page

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

Y los modificamos para quitarles el Scaffold y quitar la referencia a `CustomAppMenu`.

Modificamos también `route_generator.dart` para que hagan match con los nuevos nombres de nuestras views.

### Layout Pages

Modificamos `main.dart` para añadir un builder, que será nuestro layout.

También modificamos `main_layout_page.dart` para recibir el Widget que se cargará en el layout.

Es decir, el layout es el menú de navegación, un Spacer() arriba y otro abajo. La vista es lo único que estamos renderizando, y la pasamos por parámetro al layout.

Ahora tenemos que resolver un problema, y es que el menú de navegación no funciona al pulsar los enlaces. Nos hace falta usar navigatorKey en `main.dart`, porque es quien tiene la referencia a la navegación que este builder me está creando. Sin eso, al pulsar en el menú de navegación no va a esa página.

### GlobalKey - NavigatorState

Vamos a corregir la parte de la navegación. Necesitamos mantener la referencia al `navigatorKey`. Este navigatorKey es quien controla las rutas.

Primero vamos a resolverlo de una manera fea y luego vamos a resolverlo mejor con `Get_it` para inyectar dependencias (no lo vamos a resolver con provider, aunque también se podría de manera sencilla)

Dentro de la carpeta `lib` creamos la carpeta `services` y dentro el archivo `navigation_service.dart` que trataremos como un Singleton para obtener solo una key para toda la app.

Luego modificamos `main.dart` para usar el key creado en `navigation_service.dart`.

Ahora ya puedo usar ese key para navegar, en lugar de la navegación tradicional que estábamos usando. Modificamos `custom_app_menu.dart`.

Con esto tenemos una URL Friendly, pero nos sigue faltando por resolver el tema de los segmentos y los query parameters.

### Get_it

Vamos a sustituir el Singleton feote que hemos creado, y que es bastante difícil de probar.

Modificamos `navigation_service.dart` para volver a dejar la clase pública y eliminar la creación de la instancia.

Tenemos que crear un Singleton de otra manera y que se encuentre de manera global en nuestra aplicación.

De nuevo, esto podemos hacerlo con un `ChangeNotifierProvider`, pero lo vamos a hacer usando el paquete `get_it`: `https://pub.dev/packages/get_it` que nos permite inyectar dependencias. No es un gestor de estados, por lo que no redibuja Widgets (aunque puede si usamos streams).

Lo instalamos usando `PubSpec Assist`, indicando el paquete `get_it`.

Para hacerlo funcionar:

Dentro de la carpeta `lib` creamos un nuevo archivo llamado `locator.dart`. En este archivo mantendremos todos los singleton de manera centralizada. Lo bueno es que es muy rápido y es fácil de probar.

Ahora lo configuramos en `main.dart`, para usar nuestro locator.

Y por último, corregimos `custom_app_menu.dart` usando de nuevo nuestro locator.

### Menú Responsivo

Cuando el menú se hace de cierto tamaño, menos de 520px ya empieza a verse mal. En ese tamaño vamos a cambiar el menú de un row a un column.

Cuando las dimensiones de la pantalla cambian, se vuelve a redibujar el menú de navegación. Esto Flutter lo hace muy eficientemente.

Modificamos `custom_app_menu.dart`. Queremos que por si solo pueda detectar el tamaño del dispositivo para que el contenido que se visualice sea responsivo. Sabemos que tal y como está funciona bien en tablets y en desktop. Lo que hacemos es extraer el Widget `Container` y darle un nombre de clase private (con guión bajo) `TabletDesktopMenu`. Ahora copiamos esa clase y la pegamos abajo, y le cambiamos el nombre a `_MobileMenu` y cambiamos para que en vez de un Row sea un Column.

## Segmentos de URL y Query Parameters

He copiado la aplicación `bases_web` y le he dado el nombre `bases_web_segmentos_query`.

Esta aplicación es la que voy a seguir evolucionando.

### Temas puntuales de la sección

Aquí tocaremos conceptos fundamentales de cualquier aplicación Web, como es el hecho de recibir parámetros de query y segmentos de URL, los cuales usaremos mucho más adelante en nuestras aplicaciones.

Principalmente me quiero enfocar en esos dos puntos en la sección y a su vez, enseñar cómo mantener la aplicación basado en el URL y recuperación de múltiples segmentos.

### Continuación de proyecto y explicación breve sobre Flutter Navigator 2.0

https://docs.flutter.dev/ui/navigation

Como es demasiado complejo, vamos a usar `Fluro`. Otra opción sería `Go_Router`.

### Fluro - Router

https://pub.dev/packages/fluro/versions/2.0.5

Instalamos el paquete `fluro` usando `PubSpec Assist`.

Ya no usamos el archivo `route_generator.dart`. Lo he borrado (puede seguir viéndose en el proyecto `bases_web`).

Creo en la carpeta `router` el archivo `router.dart`.

Modificamos `main.dart` para empezar a usar `router.dart`.

### Rutas de mi aplicación y animaciones

Añadimos el resto de rutas necesarias y el tipo de transición en `router.dart`.

### 404 Page

Añadimos la ruta 404 en `router.dart`.

Modificamos `view_404.dart` para que utilice el sistema de navegación con nuestro key al pulsar el botón Regresar..

### Obtener segmentos del URL

Con nuestro nuevo sistema de rutas, usando Fluro, trabajar con segmentos del URL es muy fácil.

Modificamos `router.dart`.

Modificamos también `custom_app_menu.dart` para crear un botón con un ejemplo ya preparado para tener segmentos.

Nos queda saber como coger el valor del segmento URL y que dicho valor vaya y sustituya el valor del contador.

### Leer la base por URL y aplicarlo al contador

Si se que, en `router.dart`, `:base` siempre va a tener un valor, puedo crear un handler independiente, manejar la ruta y mandarle un argumento independiente. O puedo usar el mismo handler y hacer un if para saber si tenemos o no el segmento.

En nuestro ejemplo voy a usar el mismo handler. En `router.dart` mando la base cuando llamo a `CounterView()`.

Modificamos `counter_view.dart` para indicar que recibimos un argumento y lo tratamos.

### Leer la base por un query parameter

Un query parameter son argumentos opcionales. Eso tenemos que tenerlo en cuenta.

No creamos un `router.define` ya que eso implica que la ruta esperada es obligatoria, caso de los segmentos URL. Lo manejamos directamente en el handler.

Modificamos `custom_app_menu.dart` para crear un botón con un ejemplo ya preparado para tener query parameters.

Modificamos `router.dart` para mandar el valor del query parameter.

Modificamos `counter_provider_view` para que reciba los query parameters y también `counter_provider.dart` para que le llegue el valor.

### Múltiples segmentos de URL

En `router.dart` nos definimos una nueva ruta con múltiples segmentos.

Probar en el navegador esta ruta: `http://localhost:49399/#/dashboard/users/abc123/admin`

### Separar los handlers de las rutas

Vamos a separar la lógica de los handlers a un archivo independiente.

La idea es que podemos tener distintos manejadores, como manejadores de rutas de usuarios, de productos... Eso se hace creando controladores especializados, como se haría en Spring o Nest.

En la carpeta `router` creamos un nuevo archivo `route_handlers.dart`.

Tomamos cada uno de los handlers de `router.dart` y nos los llevamos a `route_handlers.dart`.

También tenemos que modificar las importaciones de `router.dart`.

## Scrollable Landing Page

Nuevo proyecto `vertical_landing_page`

### Temas puntuales de la sección

Esta sección es muy importante para comprender aún más el funcionamiento de los URLs en Flutter Web, pero a la vez crearemos una aplicación bonita y elegante que tenga una interacción con diferentes elementos entre sí.

Puntualmente veremos:

- Menú personalizado
- Animaciones
- PageController
- Segmentos de URL
- Posiciones iniciales del PageController
- Y muchas otras cosas

### Inicio de proyecto

Creamos el proyecto usando, en VSCode, `Flutter: New Project` e indicamos el nombre `vertical_landing_page`.

Modificamos `main.dart`.

Creamos la estructura de directorios. Siempre dentro de la carpeta `lib` creamos las carpetas:

- `providers`
- `router`
- `ui`
  - `pages`
  - `shared`
  - `views`

Dentro de la carpeta `pages` creamos una página `home_page.dart`.

Recordar que un `page` es un archivo que tiene un Scaffold, es decir, es toda la pantalla. En el caso de un `view` nos referimos a un segmento de la pantalla y no tienen un Scaffold.

### Configurando las rutas

Instalamos, usando `PubScpec Assist` el paquete `fluro` para configurar nuestras rutas.

En la carpeta `router` creamos el archivo `router.dart` y su controlador de rutas `router_handlers.dart`.

En `main.dart` tenemos que hacer dos cosas:

- Utilizar nuestro router cuando se crean las rutas
- Llamar a configureRoutes()
