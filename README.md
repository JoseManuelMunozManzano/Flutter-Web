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
