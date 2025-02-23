import 'package:flutter/material.dart';

import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/counter_provider_page.dart';
import 'package:bases_web/ui/pages/page_404.dart';

// Clase que va a trabajar en la creación de todas las rutas de manera automática.
class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case '/stateful':
        return _fadeRoute(CounterPage(), '/provider');
      case '/provider':
        return _fadeRoute(CounterProviderPage(), '/provider');
      default:
        return _fadeRoute(Page404(), '/404');
    }
  }

  // Cambiamos la forma de transición entre rutas.
  static PageRoute _fadeRoute(Widget child, String routeName) {

    return PageRouteBuilder(
      // Para recuperar todo nuestro URL tenemos que trabajar con nuestros settings.
      // Los arguments son los de la ruta. Podemos mandar un objeto...
      // Por ahora solo nos hace falta el nombre de la ruta, para que aparezca en la URL.
      settings: RouteSettings(name: routeName),
      pageBuilder: (_, __, ___) => child,
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (_, animation, __, ___) =>
        // Si no queremos transición, en vez de FadeTransition, mandamos el child y ya está.
        // child,
        //
        // O, con la transición.
        // Vamos a dejarlo con la transición por el efecto que haremos luego, llamado Giro Animation,
        // que trabaja en base a la duración de la transición (arriba)
        FadeTransition(
          opacity: animation,
          child: child,
        )
    );
  }
}
