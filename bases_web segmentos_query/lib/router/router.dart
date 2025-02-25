import 'package:fluro/fluro.dart';

import 'package:bases_web/ui/views/counter_provider_view.dart';
import 'package:bases_web/ui/views/counter_view.dart';
import 'package:bases_web/ui/views/view_404.dart';
import 'package:flutter/material.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.define(
      '/',
      handler: _counterHandler,
      // Si no queremos ningún tipo de transición indicar TransitionType.none
      transitionType: TransitionType.fadeIn,
      // transitionDuration: Duration(milliseconds: 300)
    );

    router.define(
      '/stateful',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/provider',
      handler: _counterProviderHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/404',
      handler: _pageNotFound,
      transitionType: TransitionType.fadeIn,
    );

    router.notFoundHandler = Handler(
      handlerFunc: (context, params) {
        if (context == null || !context.mounted) {
          return const View404();
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          router.navigateTo(
            context,
            '/404',
            replace: true, // Reemplaza la ruta para que la animación sea idéntica a las demás
            transition: TransitionType.fadeIn,
          );
        });
        return const SizedBox.shrink(); // Devuelve un widget vacío para evitar errores
      },
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
    handlerFunc: (context, params) => CounterView(),
  );

  static final Handler _counterProviderHandler = Handler(
    handlerFunc: (context, params) => CounterProviderView(),
  );

  static final Handler _pageNotFound = Handler(
    handlerFunc: (_, __) => View404(),
  );
}
