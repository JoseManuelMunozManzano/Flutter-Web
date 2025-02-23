import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/counter_provider_page.dart';
import 'package:bases_web/ui/pages/page_404.dart';

final routeGenerator = GoRouter(
  initialLocation: '/stateful', // Ruta inicial
  routes: [
    GoRoute(
      path: '/stateful',
      pageBuilder:
          (context, state) => transitionPage(CounterPage()),
    ),
    GoRoute(
      path: '/provider',
      pageBuilder:
          (context, state) => transitionPage(CounterProviderPage()),
    ),
    GoRoute(
      path: '/404',
      pageBuilder: (context, state) => transitionPage(Page404()),
    ),
  ],
  errorPageBuilder: (context, state) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.go('/404'); // Redirige a /404 y cambia la URL correctamente
    });
    return transitionPage(Page404());
  },
);

// Si es web no hace transiciones entre página.
Page<dynamic> transitionPage(Widget child) {
  if (kIsWeb) {
    return NoTransitionPage(child: child);
  }

  return CustomTransitionPage(
    child: child,
    transitionDuration: const Duration(
      milliseconds: 300,
    ), // Ajusta duración para que sea más fluido
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Desliza desde la derecha
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
