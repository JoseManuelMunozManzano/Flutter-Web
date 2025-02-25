import 'package:bases_web/ui/views/counter_view.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: _counterHandler
    );
  }

  // Handlers
  // Es lo que queremos que se ejecute cuando la aplicación ingresa a una ruta.
  // Esto también funciona para dispositivos móviles.
  // handlerFunc trabaja con el context y con params, que son los segmentos y query parameters.
  // Gracias al context, podríamos saber si el usuario está autenticado, tiene acceso, si
  // viene el argumento deseado y, condicionalmente, retornar una u otra vista.
  // Regresa una página (tiene Scaffold) o una vista.
  // En este caso, queremos reemplazar vistas para que el menú de navegación no se recargue.
  static final Handler _counterHandler = Handler(
    handlerFunc: (context, params) => CounterView()
  );
}
