# FLUTTER WEB

Curso de Fernando Herrera: `https://cursos.devtalles.com/courses/flutter-web`

## Orden de los proyectos

- bases_web
- bases_web_segmentos_query
- vertical_landing_page
- admin_dashboard

## Flutter Web - Introducción

### Temas puntuales de la sección

Esta es una sección introductoria, la cual tiene por objetivo hablar sobre:

- Consideraciones importantes sobre Flutter Web
- ¿Qué puede hacer y qué cosas no?
- Material adicional para seguir expandiendo el conocimiento
- Un exponente fuerte que utiliza Flutter Web
- Pros y contras

La idea es que antes de comenzar, tengan un panorama general del poder y limitantes de Flutter Web.

En esta sección además tomaremos nuestro landing page y la desplegaremos en la Web.

Hablaremos un poco de generalidades e instalaremos nuestra aplicación en el dispositivo físico como una PWA (Progressive Web App)

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

### HomePage

Modificamos `home_page.dart` para hacerlo de verdad un page (con Scaffold).

Instalamos el paquete `google_fonts` usando `PubSpec Assist`.

Creamos las vistas que se van a mostrar dentro de nuestro page. Dentro de la carpeta `views` creamos los archivos:

- `about_view.dart`
- `contact_view.dart`
- `home_view.dart`
- `location_view.dart`
- `pricing_view.dart`

Mostramos todas estas views dentro de `home_page.dart`.

### Crear un gradiente de fondo

Modificamos `home_page.dart` para crear un gradiente y que quede bien cuando, al principio de la página estiro hacia abajo (efecto móvil de estirar con el dedo) o al final de la misma estiro hacia arriba.

NOTA: En el curso, al estirar se ve blanco, pero esto ya no hace falta porque no veo que ese estiramiento sea posible en Web a día de hoy. Lo dejo porque así aprendo a hacer un gradiente.

### Menú superior - Botón y Texto

Vamos a añadir a `home_page.dart` nuestro menú.

El menú lo creamos en la carpeta `shared`, con nombre `custom_app_menu.dart`.

### Animaciones del menú

Hacemos que, al pulsar click en el menú, el icono cambie a una X y la palabra Menú se posiciona en el centro.

Estos cambios los hacemos en `custom_app_menu.dart`.

### Opciones del menú

Vamos a hacer más legible nuestro código de `custom_app_menu.dart`. Para ello, extraemos el Widget `Row` a una clase privada. También hacemos que haya más puntos en el menú.

Creamos en la carpeta `shared` un archivo `custom_menu_item.dart` que configura cada elemento del menú de forma genérica.

### Detalles estéticos del menú

Arreglamos un par de detalles estéticos del menú. Para ello modificamos `custom_app_menu.dart`.

Instalamos un paquete de animaciones `animate_do` usando `PubSpec Assist` y modificamos `custom_menu_item.dart`.

### Scroll hacia una página en específico

Queremos que, al hacer click en uno de los puntos del menú, el scroll se mueva automáticamente a esa pantalla.

Esto es fácil si sabemos como funciona el gestor de estado en Flutter.

Un `PageController` nos permite hacer la navegación a una pantalla o slide en particular, pero tenemos que mantener la referencia al mismo para que los hijos (los puntos del menú) puedan acceder a él, y hacer uso de ese PageController para poder decirle a qué página ir.

Es decir, necesito ese PageController de manera global.

Por eso necesitamos un gestor de estado. Vamos a usar `provider` y lo instalamos como siempre, usando `PubSpec Assist`.

En la carpeta `providers` creamos el archivo `page_provider.dart`.

Como quiero mis providers de manera global, modifico `main.dart`.

Ahora conecto el provider en `home_page.dart`.

En cada una de las opciones del menú uso la función creada en mi provider para hacer el scroll. Modifico `custom_app_menu.dart`.

### Cambiar el URL al hacer click en un enlace

Nuestro scroll ya funciona, pero vemos que al hacer click en un punto del menú no cambia la URL.

Modificamos `page_provider.dart` porque es donde hacemos el cambio físicamente cuando se hace click en uno de los enlaces del menú.

Instalamos, usando `PubSpec Assist` el paquete `universal_html`. Con este paquete podemos navegar al URL indicado, y funciona en todos los tipos de dispositivos. Podemos usar todas las funciones de `html`, `window`, `history`... sin tener que hacer condiciones especiales para saber si es un móvil, web... Si por lo que sea no funciona, no ejecuta el procedimiento, pero sin reventar la app.

### Utilizar el segmento para definir la pantalla inicial

Queremos que, al cambiar manualmente la URL, se lea ese segmento y se haga el scroll automático a esa view.

Nos creamos un nuevo método en `page_provider.dart` llamado `createScrollController()`.

En `router_handlers.dart` leemos el segmento y llamo a la nueva función de mi provider.

### Añadir un listener de movimiento del PageController

Cuando nos movemos con la rueda del ratón, se va cambiando el view, pero vemos que eso no se refleja en el URL.

Tenemos todo lo necesario en `page_provider.dart`, en concreto en `scrollController`. Tenemos que añadir un listener para estar escuchando los movimientos.

### Cambiar el título de la página web

Queremos cambiar el título `Landing Page` por el nombre de la página en la que nos encontramos.

Modificamos `page_provider.dart`.

## Desplegando una aplicación de Flutter Web

En esta sección tomaremos nuestro landing page y la desplegaremos en la Web.

Hablaremos un poco de generalidades e instalaremos nuestra aplicación en el dispositivo físico como una PWA (Progressive Web App)

### Generar el build web

Necesitamos generar el build o bundle de producción para desplegar en un sitio web.

Ejecutamos el mandato `flutter build web`.

Nuestro sitio web queda en la carpeta `build/web`. Todo nuestro código queda en `build/web/main.dart`.

Ahora solo tenemos que llevarnos la carpeta `build/web` a nuestro hosting.

### Configuración básica de una PWA

https://web.dev/learn/pwa/

Los archivos cruciales para transformar nuestra web a una PWA son `build/web/flutter_service_worker.js` y `web/manifest.json`.

**Service Worker**

Se puede ver como si fuera un proxy, es decir, nuestra app primero viene al Service Worker antes de hacer otra cosa.

La estrategia que usa una PWA es `Network first with Cache Fallback`, es decir, primero va a la web a ver si puede obtener el recurso, y si no lo consigue, utiliza el recurso que está en local en la caché.

**Manifest**

En `web/manifest.json` modificamos alguna cosita.

Igual en `web/index.html`.

No modificar el mismo archivo existente en `build/web/manifest.json` porque cada vez que se haga un build se reescriben todos los ficheros.

Una vez modificado volvemos a lanzar el build.

### Desplegar la aplicación de Flutter Web en Docker en Raspberry Pi

Voy a desplegar mi app en Docker, en mi Raspberry Pi. Para ello:

- Creamos el fichero `Dockerfile` en la raiz
- Creamos el archivo `docker-compose.yml` que también tengo en la raiz
- Pasamos el contexto a mi docker de Raspberry Pi
  - docker context use docker-pi
- Ejecutamos los comandos
  - docker-compose build
  - docker-compose up -d
- Ver los logs de Nginx
  - docker logs flutter_web_landing_page
- Acceder a la web
  - http://192.168.50.2:8087

## Admin Dashboard - UI Login

Proyecto `admin_dashboard`.

Este es el último proyecto que se hace en el curso, pero va a involucrar muchas cosas: autenticación, formularios, paginación, posteo de imágenes y archivos en la nube, comunicación con backend, maneja tokens, interceptores mediante headers...

### Temas puntuales de la sección

El objetivo de la sección es que empecemos a dejar las bases de la navegación y diseño del login, la pantalla del registro y preparar el proyecto para todo lo que viene después.

Esta sección es puro diseño y estructura de la aplicación.

### Inicio del proyecto - AdminDashboard

Como este proyecto es bastante grande, la estructura del filesystem tiene que ser bastante limpia para que, el día de mañana, sea fácil encontrar las cosas.

Creamos este nuevo proyecto usando el comando de VSCode `Flutter:New Project` y le damos el nombre `admin_dashboard`.

Una vez generado, accedemos a `lib/main.dart`, borramos todo y generamos un esqueleto de aplicación utilizando el snippet `mateapp` que modificamos un poco.

Instalamos, usando `Pubspec Assist`, la dependencia `fluro`.

Creamos la estructura de nuestro proyecto:

- En la carpeta `lib` creamos las carpetas `ui`, `providers`, `router` y `services`, donde en este último estarán los fuentes encargados de hacer peticiones http o procesos que no implican re-renderizar
- Dentro de `ui` creamos las carpetas `layouts`, `buttons`, `views`
- Dentro de `layouts` creamos las carpetas `auth` y `dashboard`, es decir, va a haber dos layouts

### Definir rutas y AuthLayout

Vamos a crear el primer layout, el de autenticación, que nos va a permitir mostrar el login y el register.

Dentro de la carpeta `auth` creamos el archivo `auth_layout.dart`.

Dentro de la carpeta `views` creamos el archivo `login_view.dart`.

Dentro de la carpeta `router` creamos el archivo `router.dart` y va a contener la configuración básica de mis rutas.

En la carpeta `router` vamos a crear archivos independientes de handler para administración y para el dashboard. Creamos en `router` el archivo `admin_handlers.dart`.

Utilizamos en `main.dart` el router creado.

### No Page Found - Route

Vamos a hacer que nuestra página 404 sea una vista. Más adelante veremos como pasar de un Layout a otro Layout.

En la carpeta `views` creamos la vista `no_page_found_view.dart`.

Instalamos, usando `Pubspec Assist` el paquete `google_fonts`.

Modificamos `router.dart` y añadimos un nuevo handler en la carpeta `router` llamado `no_page_found_handlers.dart`.

### Diseño del AuthLayout

Para esta clase nos pasaron el logo de Twiter y su fondo.

Creo un directorio en el raiz del proyecto llamado `assets` y los muevo ahí.

Ahora nos vamos al archivo `pubspec.yaml` e indicamos:

```yaml
assets:
  - assets/
```

porque queremos que los assets sean parte de los recursos que vamos a tener en la aplicación.

Con esto ya tenemos acceso a esas imágenes.

Modificamos ahora `auth_layout.dart`. Vamos a hacer el diseño para la web (desktop) y luego lo vamos a adaptar a móvil.

### BackgroundTwitter

Como vamos a colocar bastante código, para que sea más fácil de mantener, vamos a crearlo en un nuevo archivo.

Dentro de la carpeta `auth` creamos una nueva carpeta `widgets` y dentro el archivo `background_twitter.dart`.

Estos widgets van a ser los necesarios para construir nuestro AuthLayout y no los vamos a reutilizar. Si los fuéramos a reutilizar en otro layout, entonces podría crear la carpeta `ui/widgets`, pero no es el caso.

También modifico `auth_layout.dart` para llamar a `BackgroundTwitter`.

### Custom Title y espacio para la vista

Modificamos `auth_layout.dart` y vamos a crear un título personalizado que va a funcionar como un widget independiente.

Solo va a funcionar para AuthLayout, así que creamos un nuevo archivo en `auth/widgets` llamado `custom_title.dart`.

Modificamos `main.dart` para mandar la view a `AuthLayout`. Tengo que corregir `auth_layout.dart` para poder trabajar con ese argumento.

Modificamos `login_view.dart` para que se vea claro que espacio tenemos para mostrar el login o el register.

### Barra de enlaces inferior y enlaces

Vamos a trabajar con la parte de abajo de nuestro layout, donde vamos a añadir unos enlaces.

Modificamos `auth_layout.dart` para añadir los enlaces.

En la carpeta `auth/widgets` creo el archivo `links_bar.dart`. Aquí creo un Widget LinkText que, como voy a reutilizar me lo llevo a la carpeta `ui/buttons`. Ahí creo el archivo `link_text.dart`. Su funcionalidad es la de un botón.

### Anchor Tag

Vamos a transformar `link_text.dart` para que realmente parezca un enlace en el que deje el cursor encima y se reaccione.

Para eso necesito un estado que reaccionará cuando el cursor esté encima o salga del enlace.

Por lo tanto, tenemos que transformar `link_text.dart` a un Stateful Widget.

También modificamos `links_bar.dart` para pasar una función de prueba a ejecutar al pulsar click en el enlace.

### Diseño para teléfonos

Cuando el ancho sea menos de 1000px vamos a cambiar el diseño para que se vea bien en teléfonos móviles.

Modificamos `auth_layout.dart` y `links_bar.dart`.

### Scrollbar

Vamos a mostrar un scrollbar para que el usuario tenga claro que hay más pantalla.

Modificamos `auth_layout.dart` y `main.dart` para personalizar el scrollbar.

### Formulario de Login

Vamos a trabajar ahora, dentro del layout, al espacio asignado a la vista.

Modificamos `login_view.dart` para crear el formulario.

### Botón personalizado de ingreso

Seguimos modificando `login_view.dart` para crear el formulario.

En la carpeta `ui/buttons` nos creamos un nuevo botón `custom_outlined_button.dart`.

### Formulario de Registro

Nos creamos, en la carpeta `ui/views` la view `register_view.dart`.

Modificamos `router.dart` para añadir la ruta de la view de registro recien creada y en `admin_handlers.dart` añado un método handler para el registro.

Para navegar de una pantalla a la otra, modificamos `login_view.dart` y la recien creada `register_view.dart`.

### Centralizar estilos de los inputs

Vamos a refactorizar el código para poder centralizar y reutilizar los input de login y del registro.

En la carpeta `ui` creamos una nueva carpeta `inputs` y dentro el archivo `custom_inputs.dart`.

De `register_view.dart` cogemos el método `buildInputDecoration()` y nos lo llevamos al archivo recien creado con el nombre `loginInputDecoration()`. Modificamos tanto `register_view.dart` como `login_view.dart` para utilizar este método estático.

## Formularios de ingreso, registro y navegación

Seguimos con el proyecto `admin_dashboard`.

### Temas puntuales de la sección

Esta sección tiene varios objetivos principales como son:

- LocalStorage
- Captura de información de formularios
- Preparar las rutas del dashboard
- Manejar un estado global de autenticación

Poco a poco vamos preparando todo el dashboard administrativo que queremos crear.

### Creación de provider para formulario del login

Vamos a manejar los formularios de registro y de login, pero sin mandarlo todavía a un backend.

Obtendremos la información del formulario y haremos validaciones.

Vamos a usar provider para manejar el formulario de registro y de login de manera independiente. El estado de la autenticación será otro provider.

En la carpeta `providers` creamos el archivo `login_form_provider.dart`.

Instalamos, usando `Pubspec Assist` el paquete `provider`.

### Formulario de ingreso

Modificamos el archivo `login_view.dart` y `login_form_provider.dart`.

### Obtener email y contraseña

Vamos a enlazar los campos email y contraseña del formulario al provider, usando la propiedad onChanged.

Modificamos `login_view.dart` y `login_form_provider.dart`.

Instalamos un paquete para hacer validaciones de email (también podríamos usar una expresión regular). Usando `Pubspec Assists` instalamos el paquete `email_validator`.

### Formulario de registro

Vamos a realizar la misma tarea que hicimos en el formulario de ingreso, esto es, crear el provider y hacer que funcione en nuestro formulario de registro.

En la carpeta `providers` creamos el archivo `register_form_provider.dart`.

Modificamos `register_view.dart`.

### AuthProvider - Autenticación Global

Creamos un nuevo provider en la carpeta `providers` llamado `auth_provider.dart`, que tendrá el usuario que está conectado, el token de acceso y algunas cosas más.

Modificamos `login_form_provider.dart` para añadir una referencia a nuestro recién creado provider que tenemos que inyectar en `login_view.dart`.

En `main.dart` hacemos que nuestro provider sea global.

### Pequeña corrección de un expanded

En mobile hay un pequeño error. Modificamos `auth_layout.dart`, en la clase `_MobileBody` esta línea da error:

```dart
child: BackgroundTwitter()
```

Se corrige modificando `background_twitter.dart`, eliminando el widget `Expanded` y añadiéndolo a `auth_layout.dart`, en la clase `_DesktopBody`.

También arreglo un error en `auth_layout.dart`, en la sentencia:

```dart
thumbVisibility: true,
```

Porque es necesario definir un ScrollController cuando se usa esta propiedad. Se añade el ScrollController.

### Remover inyección de dependencias

Vamos a hacer una refactorización para evitar hacer la inyección del `AuthProvider` en `login_form_provider.dart`.

El motivo es evitar tener esa dependencia y esa capa de complejidad en la app.

Modificamos `login_form_provider.dart` y `login_view.dart` tanto para eliminar la inyección de dependencia como para conseguir la misma funcionalidad que antes.

### LocalStorage

https://pub.dev/packages/shared_preferences

El paquete `shared_preferences` es muy usado. Permite grabar strings, enteros ... en el `LocalStorage`.

Para instalar el paquete, usamos `Pubspec Assist` e indicamos el paquete `shared_preferences`.

En la carpeta `services` creamos el archivo `local_storage.dart`.

Modificamos `main.dart` para llamar a la configuración de LocalStorage y tener acceso a él en toda la app.

El token lo vamos a grabar en dicho LocalStorage. Por tanto, también modificamos `auth_provider.dart`.

### NavigationService

Queremos tener el control de la navegación. Esto es porque cuando nos autenticamos necesitamos movernos a otro layout.

No nos sirve la navegación para movernos a views dentro de un layout.

Queremos tener un `navigatorKey` para poder cambiar los layouts.

Para conseguir esto, modificamos `main.dart`.

Además, en la carpeta `services` creamos el archivo `navigation_service.dart`.

### Dashboard Layout

Creamos el nuevo layout. Para eso, en la carpeta `layouts/dashboard` creamos el layout `dashboard_layout.dart`.

Modificamos `main.dart` para poder acceder a nuestro nuevo layout.

En `auth_provider.dart` vamos a hacer un método para saber si el usuario está autenticado.

### Splash Layout

Cambiamos el Widget con el texto `checking` por otro layout.

En la carpeta `layouts` creamos la carpeta `splash` y dentro el layout `splash_layout.dart`.

Modificamos `main.dart`.

Modificamos también `auth_provider.dart` para navegar al Dashboard en el método `login()`.

Vemos que las rutas del navegador no se actualizan al navegar al Dashboard.

### Dashboard Routes

Necesitamos crear la ruta dashboard en la url del navegador.

Modificamos `router.dart`.

En la carpeta `router` creamos un handler `dashboard_handlers.dart`.

En la carpeta `ui\views` creamos la vista `dashboard_view.dart`.

Modificamos `dashboard_layout.dart`.

Modifico `main.dart` porque las urls en el navegador no están funcionando.

Sigue fallando cuando estoy en `/dashboard`, borro el token y refresco, ya que debería volver a `/auth/login`.

Esto se soluciona en la siguiente clase.

### Condicionalmente mostrar el DashboardView o el LoginView

Como se ha indicado, hay ciertas rutas que no están funcionando como esperamos.

Si estamos en `/dashboard` porque nos hemos autenticado y cambiamos manualmente la url a `/` se verå, en el layout del Dashboard, los widgets de LoginView.

Y, si borro el token y refresco, debería volver a `/auth/login`.

Tenemos que asegurarnos de que nuestro handler regrese la vista correspondiente dependiendo del estado en el que nos encontramos en nuestra app.

Modificamos `admin_handler.dart` para mostrar LoginView o RegisterView solo si no estamos autenticados.

Modificamos `dashboard_handler.dart` para mostrar DashboardView solo si estamos autenticados.

Si ahora alguien cambia manualmente la url no va a tener efecto porque irá al login si no está autenticado.

He vuelto a dejar `main.dart` como estaba antes. Eso significa que vuelven a no verse bien las urls, pero con el cambio anterior si en la url estaba `/dashboard` y borraba el token, el programa lanzaba una excepción.

Esto se corrige usando ahora nuestro NavigationService en `auth_provider.dart`.

Arreglamos también un pequeño error en `register_view.dart` porque no cabía, en pantalla mobile, la parte del registro en pantalla.

## Admin Dashboard Diseño

Seguimos con el proyecto `admin_dashboard`.

### Temas puntuales de la sección

Aquí tocaremos conceptos fundamentales de cualquier aplicación Web, como es el hecho de recibir parámetros de query y segmentos de URL, los cuales usaremos mucho más adelante en nuestras aplicaciones.

Principalmente me quiero enfocar en esos dos puntos en la sección y a su vez, enseñar cómo mantener la aplicación basado en el URL y recuperación de múltiples segmentos.

### BackgroundColor a Dashboard

Modificamos `dashboard_layout.dart`.

### Sidebar

Primero haremos el diseño del Sidebar para pantallas grandes y luego lo haremos para pantallas más pequeñas.

Modificamos `dashboard_layout.dart`.

En la carpeta `ui` creamos la carpeta `shared` y dentro el archivo `sidebar.dart`.

En la carpeta `ui/shared` creamos la carpeta `widgets` y dentro el archivo `logo.dart`.

### Items de menú y separadores

Seguimos modificando `sidebar.dart`.

En la carpeta `ui/shared/widgets` creamos los archivos `text_separator.dart` y `menu_item.dart`.

### Llenar las opciones del menú

Seguimos llenando nuestro sidebar con las opciones del menú. Modificamos `sidebar.dart`.

### Navbar

Creamos el Navbar en `dashboard_layout.dart`, ya que se va a mantener persistente entre las distintas views.

En la carpeta `ui/shared` creamos el archivo `navbar.dart`.

En la carpeta `ui/shared/widgets` creamos el archivo `search_text.dart`.

Modificamos `custom_inputs.dart`.

### Notificaciones y Avatar

Seguimos construyendo `navbar.dart`.

En la carpeta `ui/shared/widgets` creamos el archivo `notifications_indicator.dart`.

En la carpeta `ui/shared/widgets` creamos el archivo `navbar_avatar.dart`.

### Navbar y Sidebar responsive

Vamos a hacer que nuestra app reaccione en base a las dimensiones del dispositivo en que se ejecuta.

Modificamos `navbar.dart` y `dashboard_layout.dart`.

### Controlador del Sidebar

Vamos a hacer una animación para mostrar y ocultar el menú.

Además, cuando el menú esté abierto y se pulse click afuera, o en una opción del menú, este se debe de ocultar.

Para conseguir hacer todo esto vamos a implementar un controlador para, de manera global, saber como se está usando el menú.

En la carpeta `providers` creamos el archivo `sidemenu_provider.dart`.

Es un provider porque vamos a tener que redibujar al cambiar de página.

### Animar menú lateral

Para ver los resultados de estos cambios, en el navegador hacer que el ancho de la app sea menor de 700px.

Modificamos `dashboard_layout.dart` y `navbar.dart`.

### Cerrar el menú lateral

Vamos a cerrar el menú lateral al hacer click en cualquier otra parte de la pantalla o al hacer click en Dashboard.

Modificamos `dashboard_layout.dart` para añadir un background, que es un Widget `Opacity` con un `GestureDetector`. Al pulsar ahí, se cerrará la barra lateral.

Modificamos `sidebar.dart` para que, al pulsar en Dashboard, se cierre el menú lateral.

### Dashboard View y Blank View

Vamos a dejar las bases para poder crear nuevas vistas, es decir, vamos a preparar un cascarón que será utilizado por todas las vistas nuevas.

Modificamos `dashboard_view.dart`, y `dashboard_layout.dart`.

Para que quede como cascarón, hacemos una copia de `dashboard_view.dart` con nombre `blank_view.dart`. Cuando queramos crear una nueva vista, esta será la base.

Creamos, para reutilizar, en la carpeta `ui`:

- La carpeta `labels` y dentro el archivo `custom_labels.dart`
- La carpeta `cards` y dentro el archivo `white_card.dart`

### Icons View y Ruta

Creamos una nueva vista de Iconos.

Hacemos una copia de `blank_view.dart` y la renombramos a `icons_view.dart`.

Para definir la ruta, modificamos `router.dart` y modificamos el handler `dashboard_handlers.dart` para que regrese la vista deseada (BlankView)

Modificamos `white_card.dart`.

### Navegación utilizando el Sidebar

Queremos acceder a la vista correspondiente haciendo click en los elementos del Sidebar. En visualización mobiles, se cerrará el Sidebar.

Modificamos `sidebar.dart`.

### Activando opciones del menú

Queremos que al pulsar un elemento del Sidebar este quede seleccionado.

Modificamos `sidemenu_provider.dart` para transformarlo a un provider de verdad y jugar con el estado para saber qué elemento del Sidebar se ha seleccionado.

Modificamos `sidebar.dart`.

Modificamos `main.dart` para que se cargue desde ahí nuestro provider.

Modificamos `dashboard_handlers.dart` para llamar al método del provider `setCurrentPageUrl()`.

### Blank View, ruta y menú

Vamos a modificar la view (ya existía) `blank_view.dart`, gestionar la ruta y activar la opción del menú.

Creamos la nueva ruta modificando `router.dart` y `dashboard_handlers.dart`.

Modificamos `sidebar.dart`.

### Detalles finales del panel administrativo

Si cambiamos la url a una ruta no existente, vemos que aparece en la parte izquierda una barra grisacea.

El problema viene por un padding de `dashboard_layout.dart`. En concreto, esta línea:

```dart
padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
```

Si se comenta el padding y sustituimos el widget Padding por un Container ya no pasa, pero perdemos el padding para las demás views. Vamos a dejarlo mal para la página 404.

Hay otro error. Si indicamos una url no existente, aparece la página 404, pero queda seleccionado en el sidebar el último elemento seleccionado. Ahora no puedo seleccionar ese elemento. Tendría que indicar otro elemento y luego pulsar el que quiero seleccionar.

Modificamos `no_page_found_handlers.dart` para quitar el elemento seleccionado.

## Backend para el panel administrativo

Añadimos un proyecto hecho en Node `backend-cafe`, que será el backend de nuestro proyecto `admin_dashboard`.

### Temas puntuales de la sección

Temas de la sección

- Configurar un backend existente
- Conectar MongoDB Atlas
- Llenar la base de datos con información

El objetivo es preparar un backend real para nuestra aplicación administrativa y así hacer el ejercicio apegado a la realidad.

### Configuración de proyecto

- Para ejecutar este proyecto acceder a el y ejecutar en consola: `node app`

## Autenticación y protección de rutas

Vamos a empezar a conectar nuestras piezas de Flutter del proyecto `admin_dashboard` con el backend `backend-cafe`.

### Temas puntuales de la sección

Empezamos con el registro, login y verificación del token. Usaremos el paquete `dio` que incluye interceptores (un patrón adaptador).

### Continuación de proyecto

A partir de este momento, siempre hay que ejecutar tanto el proyecto de Flutter como el proyecto backend, este último con el comando `node app`.

### Dio - Centralizar los llamados a nuestro backend

Las peticiones que requieren un JWT tendrán una key `x-token` que irá en la parte de los `Headers`.

Vamos a tener un punto centralizado en el que vamos a poner el JWT para que todas las peticiones la utilicen. Para esto, vamos a utilizar el paquete `dio`, alternativa al paquete `http`, muy útil para, entre otras cosas, centralizar la configuración de los headers de nuestras peticiones.

Instalamos `dio` usando `Pubspec Assist`.

Creamos, en la carpeta `lib`, una carpeta `api` y dentro un archivo llamado `cafe_api.dart`.

La llamada al método de este nuevo archivo lo vamos a poner en un par de sitios. Por ahora lo ponemos en `main.dart`, que es el momento en el que mi app es construida.

### Crear usuario - Http post

Seguimos completando `cafe_api.dart` para añadir la petición post.

Modificamos `register_form_provider.dart` y `register_view.dart`.

Modificamos `auth_provider.dart`.

### Autenticando usuario en el registro

Seguimos modificando `auth_provider.dart`.

Usaremos la web `https://quicktype.io/` para generar el código de un modelo dada una respuesta JSON.

En la carpeta `lib` creamos una nueva carpeta `models` y dentro otra carpeta `http`. Dentro de esta última carpeta creamos el archivo `auth_response.dart`.

Vamos a tener aquí agrupados todos los modelos que son respuestas de http.

El código de `auth_response.dart` se genera en la web de `quicktype.io` usando la response de la creación de un usuario. Como ejemplo, he usado esta response:

```json
{
  "usuario": {
    "rol": "USER_ROLE",
    "estado": true,
    "google": false,
    "nombre": "test1",
    "correo": "test1@test.com",
    "uid": "67d9aacfee31ef110a3c0ae6"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2N2Q5YWFjZmVlMzFlZjExMGEzYzBhZTYiLCJpYXQiOjE3NDIzMTgyODcsImV4cCI6MTc0MjkyMzA4N30.PuXxdGY9oaRkMVHt4pZ5e5YSfsZoxwNTqDCOL1ZMrHs"
}
```

Modificamos `auth_provider.dart` para llamar al método `fromMap()` de `auth_response.dart`.

### Mostrar snackbars - NotificationService

Mostramos un snackbar cuando hay un mensaje de error, por ejemplo al crear una nueva cuenta con un usuario ya existente.

Lo hacemos genérico, y creamos dos tipos distintos de snackbars.

En la carpeta `services` creamos el archivo `notifications_service.dart`.

Es un servicio y no un provider porque este último puede redibujar widgets. Los servicios también pueden redibujar widgets, pero no son un ChangeNotifier Provider o NotifyListeners, porque manejamos todo mediante objetos y referencias.

Para poder mostrar estos snackbars necesito una referencia con mi app (una key). Esto lo consigo modificando `main.app`, usando la propiedad `scaffoldMessengerKey`.

Y lo mandamos llamar en `auth_provider.dart`.

### Login de usuario

Hacemos la llamada http, como hicimos en el registro, pero ahora para el login.

Modificamos `auth_provider.dart`.

NOTA: Una response de un login sería, por ejemplo:

```json
{
  "usuario": {
    "rol": "USER_ROLE",
    "estado": true,
    "google": false,
    "nombre": "test1",
    "correo": "test1@test.com",
    "uid": "67d9aacfee31ef110a3c0ae6"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2N2Q5YWFjZmVlMzFlZjExMGEzYzBhZTYiLCJpYXQiOjE3NDI0NDk0ODUsImV4cCI6MTc0MzA1NDI4NX0.-4nFXdffFJp1eGJ4HW9Jlhn114t0gIRkasYZ-kD7JvA"
}
```

Esta respuesta es la misma que ya tenemos mapeada en `auth_response.dart`. No tenemos que hacer nada aquí.

### Validar JWT

Tenemos que verificar el JWT que obtenemos al hacer login contra nuestro backend cada vez que la aplicación se recarga o cuando necesitamos realizar alguna interacción contra el backend, que obviamente espera recibir ese JWT.

En el backend tenemos un endpoint para renovar o validar el JWT. Si el token es válido devuelve esto:

```json
{
  "usuario": {
    "rol": "USER_ROLE",
    "estado": true,
    "google": false,
    "nombre": "test1",
    "correo": "test1@test.com",
    "uid": "67d9aacfee31ef110a3c0ae6"
  },
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2N2Q5YWFjZmVlMzFlZjExMGEzYzBhZTYiLCJpYXQiOjE3NDI0NTAzMTgsImV4cCI6MTc0MzA1NTExOH0.j3oUbsG5vInOYLX3EkCVOwMHN3WCXW4AfTDs9mjXNB8"
}
```

Vemos que devuelve un nuevo token (aunque no lo usamos).

Para implementar esta llamada modificamos `auth_provider.dart`.

Modificamos `dashboard_view.dart` para mostrar el nombre del usuario.

### Logout

El logout consiste en eliminar la key `token` del LocalStorage.

Modificamos `auth_provider.dart` para crear esta funcionalidad.

El logout es llamado desde `sidebar.dart`.

### Submit cuando se presiona Enter

Queremos que, al pulsar Intro al hacer login o el registro, si los datos son correctos, haga la misma funcionalidad que pulsar el botón Ingresar o Crear cuenta.

Modificamos `login_view.dart` y `register_view.dart`.

## Mantenimiento de categorías

Continuamos con el proyecto `admin_dashboard` y el backend `backend_cafe`.

Vamos a crear un CRUD completo. Para mostrar la data en tabla de forma paginada usaremos el Widget `PaginatedDataTable`. En esta sección vemos los fundamentos de este Widget, con la idea de poder configurar cada row de la tabla como queramos, y en la siguiente haremos un uso más avanzado del mismo.

### Temas puntuales de la sección

Esta sección tiene por objetivo crear un CRUD en una colección. Puntualmente tocaremos los siguientes temas:

- Widget PaginatedDataTable
- Paginación
- Modals
- CRUD
- Prompts
- DataTableSource

### Crear ruta y vista para las categorías

De la carpeta `ui/views` uso el cascarón `blank_view.dart` para crear la view `categories_view.dart`.

Una vez tenemos la vista, creamos la ruta en `dashboard_handlers.dart` y `router.dart`.

Para poder acceder, modificamos también `sidebar.dart`.

### PaginatedDataTable

Modificamos `categories_view.dart` para añadir el widget `PaginatedDataTable`.

Para la fuente de datos creamos, en la carpeta `lib` la carpeta `datatables` y dentro el archivo `categories_datasource.dart`.

### Configuraciones adicionales del PaginatedDataTable

Seguimos jugando con las opciones que nos da el Widget `PaginatedDateTable`.

Modificamos `categories_view.dart`.

Creamos un botón para dar de alta una nueva categoría. En la carpeta `ui/buttons` creamos un archivo `custom_icon_button.dart`.

### Cargar las categorías desde el backend

Vamos a rellenar nuestra tabla con información del backend.

Para ello necesitamos un Provider porque al cargar las categorías tenemos que redibujar los Widgets. También funcionaría con servicios (FutureBuilder o StreamBuilder)

En la carpeta `providers` creamos el archivo `categories_provider.dart`.

El provider lo colocamos en `main.dart` para que esté disponible en toda la app.

Al provider lo llamaremos en `categories_view.dart`.

### Mapear categorías

Usaremos el generador `quicktype.io` para que nos mapee el resultado del get a las categorías.

El resultado que obtenemos es este:

```json
{
  "total": 4,
  "categorias": [
    {
      "_id": "67de7797b343760f4fb7d761",
      "nombre": "Teclados",
      "usuario": { "_id": "67d9aacfee31ef110a3c0ae6", "nombre": "test1" }
    },
    {
      "_id": "67de77a6b343760f4fb7d766",
      "nombre": "Monitores",
      "usuario": { "_id": "67d9aacfee31ef110a3c0ae6", "nombre": "test1" }
    },
    {
      "_id": "67de77afb343760f4fb7d76b",
      "nombre": "Micrófonos",
      "usuario": { "_id": "67d9aacfee31ef110a3c0ae6", "nombre": "test1" }
    },
    {
      "_id": "67de77bab343760f4fb7d770",
      "nombre": "Controles",
      "usuario": { "_id": "67d9aacfee31ef110a3c0ae6", "nombre": "test1" }
    }
  ]
}
```

En la carpeta `models/http` creamos el archivo `categories_response.dart`.

En la carpeta `models` creamos el archivo `category.dart`.

Usamos CategoriesResponse en `categories_provider.dart`.

### PaginatedDataTable con la información del backend

Vamos a pasar las categorías obtenidas a la view.

Modificamos `categories_view.dart` y `categories_datasource.dart`.

### Mensaje de confirmación de eliminación

Modifico `categories_datasource.dart` y `categories_view.dart`.

Para corregir el fondo que se visualiza al aparecer el dialog, modificamos `dashboard_layout.dart`. Cogemos su padding y nos lo llevamos a `categories_view.dart`, `blank_view.dart`, `icons_view.dart`, `no_page_found_view.dart` y `dashboard_view.dart`.

### Modal para editar y agregar categorías

En la carpeta `ui` nos creamos una carpeta `modals` y dentro el archivo `category_modal.dart`.

Al modal lo llamamos desde `categories_view.dart`.

### Contenido del modal de categoría

Modificamos `category_modal.dart` y `custom_outlined_button.dart`.

### Crear categorías

Vamos a crear una nueva categoría en nuestro backend y a mostrarla.

Vamos a crear el canal de comunicación en el provider `categories_provider.dart` para mandar llamar la creación de una nueva categoría.

Llamamos en `category_modal.dart` al pulsar el botón guardar.

### Actualizar categoría

En `cafe_api.dart` creamos un método para hacer put.

Actualizamos `categories_datasource.dart` para que funcione el icono de actualización de categoría.

En `categories_provider.dart` creamos un método para actualizar categorías y tenemos que cambiar el nombre de la categoría correcta.

También actualizamos `category_modal.dart`.

### Eliminar categoría

En `cafe_api.dart` creamos un método para hacer delete.

Actualizamos `categories_datasource.dart` para que funcione el icono de eliminación de categoría.

En `categories_provider.dart` creamos un método para actualizar categorías y tenemos que cambiar el nombre de la categoría correcta.

### Snackbars de creación y actualización

Cuando se elimina una categoría, realmente se hace un soft delete, es decir, el state de la fila en MongoDB queda como false, lo que hace que no se visualice.

Pero si se intenta dar de alta el mismo nombre de categoría, el POST da error.

Como queremos mantener la integridad referencia, vamos a mostrar un snackbar para indicar si ha habido algún problema o no a la hora de crear/actualizar una categoría.

Modificamos `category_modal.dart`, `notifications_service.dart` y `categories_provider.dart`.

Problema que veo: cuando actualizo a un nombre ya existente, en la app de Node sale de la app.

Actualizo el backend, el archivo `controllers/categorias.js`, método `actualizarCategoria`.

## Optimizaciones

Continuamos con el proyecto `admin_dashboard` y el backend `backend_cafe`.

### Optimizaciones en el manejo de rutas

Hemos venido trabajando la navegación de Flutter como se haría en una aplicación móvil, en el sentido de que en una app móvil cuando navegamos a otra pantalla se pone encima de la anterior y esto hace que tengamos todo el historial de estos Widgets abiertos y que, ante cualquier cambio (animación, el cursor msimo), se redibuja todo, lo que hace que haya una precisión de píxels perfecta.

En la web no funciona así. Cuando navegamos a una nueva pantalla, destruimos la anterior.

A nivel programación, en lugar de ejecutar `Navigator.pushNamed` tenemos que ejecutar `NavigagorpushReplacementNamed`.

Modificamos `login_view.dart` y `register_view.dart`.

También modificamos `sidebar.dart`.

Modifico también comentarios de `navigation_service.dart`.

### Crear múltiples usuarios en nuestra BBDD

Creamos varios usuarios en la BBDD usando Postman.

## Mantenimiento de usuarios

Continuamos con el proyecto `admin_dashboard` y el backend `backend_cafe`.

Hacemos un uso avanzado del `PaginatedDataTable`.

### Temas puntuales de la sección

En esta sección nos enfocaremos en el mantenimiento de usuarios, específicamente los siguientes puntos:

- Ordenar tabla mediante los encabezados de las columnas
- Segmentos de URL
- Formularios
- Diseño de dos columnas
- Validar segmento de URL contra el backend
- Manejo de errores

La idea de este mantenimiento es que preparemos todo lo que ocupamos para poder actualizar los usuarios y dejar abierta las puertas para la siguiente sección donde actualizaremos la fotografía del mismo.

### Assets de loader y de no imagen

He guardado en la carpeta `assets` las imágenes `loader.gif` y `no-image.jpg`.

Vamos al archivo `pubscpec.yaml` y guardamos el archivo para que dispare el `flutter pub get`. Esto revisa las depedencias que están en los assets y los va a adicionar.

### Ruta y vista de usuarios

Modificamos `router.dart` y `dashboard_handlers.dart`.

Usando la plantilla `ui/views/blank_view.dart` creo la vista `users_view.dart`.

Modificamos `sidebar.dart` para que funcione el click de Users.

### UsersView temporal

Modificamos `users_view.dart` para incluir un `PaginatedDataTable`.

Creamos un datasource en `datatables` llamado `users_datasource.dart`.

### UsersProvider

Vamos a obtener del backend los datos de los usuarios y mostrarlo en nuestro `PaginatedDataTable`.

Creamos en la carpeta `providers` un provider `users_provider.dart`.

En la carpeta `models` creamos un archivo `usuario.dart` y nos llevamos la `class Usuario` desde `auth_response.dart` a este nuevo archivo. Añadimos el campo `img`.

Para el mapeo de la información que viene del backend, usamos `quicktype.io`. Creamos en `models/http` el modelo de respuesta generado, con nombre `users_reponse.dart`.

Modificamos `main.dart` para crear la instancia del provider.

Creamos una variable del provider en `views/users_view.dart`, pero queda pendiente el uso del mismo.

### Llenar la tabla con los usuarios

Ahora si, llenamos la tabla en `users_view.dart`.

También modificamos `users_datasource.dart` para que reciba la data y renderice lo que tenga que renderizar.

### Ordenar la lista de usuarios

Como tenemos toda la data en el front, ordenaremos en el front en vez de hacer otra petición al back y que este me la devuelva ordenada.

Modificamos `users_provider.dart` y `users_view.dart`. Este último archivo es el que manda el criterio de ordenación.

### Indicadores visuales de la columna ordenada

Modificamos `users_view.dart` y `users_provder.dart`.

### User View y Ruta para un usuario independiente

Vamos a preparar la ruta para que permita segmentos.

Creamos primero la vista. En la carpeta `views` hacemos una copia de `blank_view.dart` y le damos el nombre `user_view.dart`.

Definimos la ruta. Modificamos `router.dart` y `dashboard_handlers.dart`.

Modificamos `users_datasource.dart` para que llame a `user_view.dart`.

### Validar UID contra el backend

Modificamos `user_view.dart`.

Modificamos `users_provider.dart`.

### Diseño de la pantalla de User View

Vamos a crear la estructura de la pantalla como una tabla, modificando `user_view.dart`.

### Espacio para el avatar del usuario

Seguimos modificando `user_view.dart` para crear la pantalla, en este caso el diseño del Avatar.

Modificamos `custom_labels.dart`.

### Espacio para el formulario de actualización

Seguimos modificando `user_view.dart` para crear la pantalla, en este caso el formulario.

Modificamos `custom_inputs.dart`.

### Formulario de actualización de usuario

Vamos a controlar la información del formulario. Necesitamos mantener toda la información del estado de ese formulario.

Creamos un nuevo provider para manejar el formulario. En la carpeta `providers` creo el archivo `user_form_provider.dart`.

Modificamos `main.dart` para añadir ahí el provider y lo usamos en `user_view.dart`.

### Validaciones y valores actualizados del usuario

Modificamos `user_view.dart` para añadir las validaciones.

Modificamos `user_form_provider.dart`.

### Notificar Listeners cuando se cambia el usuario

Modificamos `user_form_provider.dart` porque como no notificamos a los listeners `notifyListeners()` entonces en `user_view.dart` no se actualiza el nombre en el avatar.

Modificamos también `user_view.dart`.

### Actualizar usuario en el Backend

Modificamos `user_form_provider.dart`, `cafe_api.dart` y `user_view.dart`.

Modificamos `user_view.dart` porque cuando volvemos a la lista, si hemos cambiado el nombre y el correo, vemos que no se ve ese nombre/correo actualizado en la lista. En este punto actualizamos la data de la lista de una forma no recomendada, que es volviendo a obtener la data del backend. Lo arreglamos en el siguiente punto.

### Actualizar el listado de usuarios

Vamos a actualizar el listado de usuarios, pero sin hacer la petición http.

Modfificamos `users_provider.dart` y `user_view.dart`.

### Manejo de errores

Si indicamos un id de un usuario que no exista, por ejemplo `http://localhost:49304/#/dashboard/users/1` no estamos manejando el error.

Modificamos `user_view.dart` y `users_providers.dart`.

También modificamos `cafe_api.dart`.

Modificamos `user_form_provider.dart` por un error que le da al instructor porque no se destruye el formKey (a mi no me ocurre ese error) al entrar a un user, cambiar el id en el url para que nos devuelva al listado de usuarios, y volver a seleccionar el mismo user. La inicialización me la llevo a `user_view.dart`.

## Carga de archivos y versión de producción

Continuamos con el proyecto `admin_dashboard` y el backend `backend_cafe`.

### Temas puntuales de la sección

Esta sección tiene por objetivo que subamos archivos a un backend mediante un selector de archivos, pero adicionalmente desplegaremos tanto nuestro backend y la aplicación de Flutter a un backend propiamente para que pueda ser utilizado desde cualquier lugar del mundo.

### Cloudinary

Los archivos los vamos a subir a Cloudinary: `https://cloudinary.com/`.

En nuestro proyecto `backend-cafe`, en el archivo `.env`, tenemos que configurar la variable de entorno `CLOUDINARY_URL`. La configuración de Cloudinary hay que hacerla en el backend, jamás en el frontend.

### Seleccionar una imagen

Vamos a seleccionar una imagen y, por ahora, obtener el nombre de la imagen seleccionada.

Tenemos que instalar el paquete `file_picker`: `https://pub.dev/packages/file_picker`.

Modificamos `user_view.dart`.

### Subir imagen al backend

Vamos a coger los bytes de la imagen y subirlo al endpoint.

Modificamos `user_form_provider.dart` y corregimos `usuario.dart` para que en el método `fromMap` trate la imagen.

Modificamos `cafe_api.dart` para añadir un método que trata el multipart.

Llamamos en `user_view.dart`.

### Mensaje de carga de imagen

Desde el momento en que empezamos a subir la imagen hasta que obtengo la url pasa un tiempo. Vamos a hacer que aparezca algo (un loader) que bloquee al usuario y que no pueda interactuar con la aplicación.

Añadimos un modal con un dialog en `notifications_service.dart`.

Modificamos `user_view.dart`.

### Mostrar imagen actualizada

Modificamos `user_view.dart` para mostrar la imagen en el contenedor del Avatar.

### Mostrar imagen del usuario en la lista de usuarios

Actualizamos en `user_view.dart` y `users_datasource.dart` la imagen del usuario.

### Reduciendo la cantidad de importaciones

Esto es una optimización para importar menos paquetes en nuestros fuentes de Dart.

Usando archivos de barril podemos importar, por ejemplo, todos los providers, solo con una línea de código.

En la carpeta `providers` creamos el archivo de barril `providers.dart` y exportamos todos los archivos de provider.

Podríamos hacer lo mismo en las carpetas `services`, `ui`...

### Generar build de produccíon

Ver: `https://docs.flutter.dev/deployment/web`.

Paramos la ejecución de nuestra app Flutter.

Vamos a desplegar la app de Flutter Web en el archivo `/public/index.html` del proyecto `backend-cafe`.

Podríamos subirla también a GitHub Pages, etc, pero nuestra app backend es un `servidor de Node` que ya está ejecutándose, así que vamos a aprovechar para desplegarla ahí.

Básicamente, lo que hay que hacer es:

- OPCIONAL: Si existe una carpeta `build` la podemos borrar
- Ejecutamos el comando: `flutter build web`
  - Nos genera la carpeta `build/web`.

Copiamos todo el contenido de la carpeta `build/web` y la copiamos en el proyecto de backend, en concreto a la carpeta `public`, borrando el archivo `index.html`.

Ahora vamos a un navegador web y accedemos a la ruta: `http://localhost:8080`. Donde antes veíamos `Acceso Denegado` ahora veremos ya nuestra app de Flutter.

No veremos los `assets`, pero la app si funciona. Para corregir las imágenes de los `assets` nos vamos a nuestro backend, a la carpeta `public/assets` y veremos que existe otra carpeta `assets`. Ese es el problema. Cortamos las imágenes que están en la carpeta hija `assets` y copiamos en la carpeta padre `assets`. La carpeta hija `assets` la podemos borrar.

### Desplegar aplicación de Flutter en Docker

En el curso se despliega la app en la Web, pero yo solo quiero desplegarla en Docker, en mi Raspberry Pi.

En el backend, en la raiz he creado los archivos `Dockerfile` y `docker-compose.yml`.

He creado una red con el comando: `docker network create cafe-net`.

Y conecto mi docker de Mongo `docker network connect cafe-net mongo`.

Para la parte de front, para que sea https, he usando NGINX. Para ello:

```
mkdir -p frontend-nginx/certs
cd frontend-nginx/certs

He creado un archivo Dockerfile

# Genera la clave privada
openssl genrsa -out key.pem 2048

# Genera el certificado autofirmado (válido por 365 días) ESTO EN MI RASPBERRY PI!! en la ruta /home/pi/docker/projects/backend-cafe/certs
openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /home/pi/docker/projects/backend-cafe/certs/key.pem \
  -out /home/pi/docker/projects/backend-cafe/certs/cert.pem \
  -subj "/C=ES/ST=Dev/L=Local/O=Dev/CN=192.168.50.2"
```

Y en `cafe_api.dart` he quitado la parte de localhost y dejado solo la ruta relativa `/api` como base del URL.

Acceder a la carpeta del backend y ejecutar `docker compose up --build -d`.

Acceder en el navegador a la app usando la ruta `https://192.168.50.2:446/`.
