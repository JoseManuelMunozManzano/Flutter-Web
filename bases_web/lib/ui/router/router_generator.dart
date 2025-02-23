import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/counter_provider_page.dart';
import 'package:bases_web/ui/pages/page_404.dart';

final routerGenerator = GoRouter(
  initialLocation: '/stateful', // Ruta inicial
  routes: [
    GoRoute(
      path: '/stateful',
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      path: '/provider',
      builder: (context, state) => const CounterProviderPage(),
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(child: const Page404()),
);
