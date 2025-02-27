import 'package:bases_web/router/route_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define('/', handler: counterHandler,
      // Si no queremos ningún tipo de transición indicar TransitionType.none
      transitionType: TransitionType.fadeIn,
      // transitionDuration: Duration(milliseconds: 300)
    );

    // Tenemos dos rutas de /stateful, una sin segmentos y otra con segmentos.
    router.define('/stateful', handler: counterHandler, transitionType: TransitionType.fadeIn);

    // Con segmentos del URL. Se puede usar el mismo u otro handler.
    router.define('/stateful/:base', handler: counterHandler, transitionType: TransitionType.fadeIn);

    router.define('/provider', handler: counterProviderHandler, transitionType: TransitionType.fadeIn);

    // Múltiples segmentos de URL. Creamos otro handler.
    router.define('/dashboard/users/:userid/:roleid', handler: dashboardUserHandler, transitionType: TransitionType.fadeIn);

    router.define('/404', handler: page404Handler, transitionType: TransitionType.fadeIn);
    router.notFoundHandler = pageNotFoundHandler(router);
  }
}
