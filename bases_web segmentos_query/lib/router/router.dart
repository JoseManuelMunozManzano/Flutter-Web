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

    // Tenemos dos rutas de /stateful, una sin segmentos y otra con segmentos.
    router.define(
      '/stateful',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn,
    );

    // Con segmentos del URL.
    // Se puede usar el mismo u otro handler.
    router.define(
      '/stateful/:base',
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

        // Ejecuta un código después de que el frame actual haya terminado de renderizarse.
        WidgetsBinding.instance.addPostFrameCallback((_) {
          router.navigateTo(
            context,
            '/404',
            replace:
                true, // Reemplaza la ruta para que la animación sea idéntica a las demás
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
  //
  // Tratamos el uso de segmentos del URL.
  // Si hacemos print(params['base']) su resultado es un arreglo de String.
  // Es un arreglo porque el valor podría ser /10,abc,1 por ejemplo.
  //
  // Si hacemos print(params) también vemos los query parameters si se añaden.
  // Por ejemplo, para esta ruta: http://localhost:50007/#/stateful/100?q=hola+que+tal&lat=10
  // params vale: {base: [100], q: [hola que tal], lat: [10]}
  // Vemos que los query parameters también es un array.
  static final Handler _counterHandler = Handler(
    handlerFunc: (context, params) {
      // Si tenemos base, entonces coge su primer valor del array.
      // print(params['base']?[0]);
      // Imprime todos los segmentos y los query params.
      // print(params);
      // Podríamos preguntar aquí si el valor esperado es un número
      // (lo hacemos en counter_view.dart) y si no se puede parsear
      // podríamos hacer que no se muestre la ruta.
      return CounterView(base: params['base']?[0] ?? '5');
    },
  );

  static final Handler _counterProviderHandler = Handler(
    handlerFunc: (context, params) => CounterProviderView(),
  );

  static final Handler _pageNotFound = Handler(
    handlerFunc: (_, __) => View404(),
  );
}
