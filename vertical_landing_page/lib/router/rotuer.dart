import 'package:fluro/fluro.dart';
import 'package:vertical_landing_page/router/router_handlers.dart';

// To-dos los métodos son estáticos porque no quiero generar ninguna instancia.
class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {

    // Rutas
    router.define('/:page', handler: homeHandler);

    // 404
    router.notFoundHandler = homeHandler;
  }
}
