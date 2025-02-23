import 'package:flutter/material.dart';

import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/counter_provider_page.dart';
import 'package:bases_web/ui/pages/page_404.dart';

// Clase que va a trabajar en la creación de todas las rutas de manera automática.
class RouteGenerator {

  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch(settings.name) {
      case '/stateful':
        return MaterialPageRoute(builder: (_) => CounterPage());
      case '/provider':
        return MaterialPageRoute(builder: (_) => CounterProviderPage());
      default:
        return MaterialPageRoute(builder: (_) => Page404());
    }
  } 
}
