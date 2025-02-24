import 'package:bases_web/locator.dart';
import 'package:bases_web/ui/layout/main_layout_page.dart';
import 'package:flutter/material.dart';
import 'package:bases_web/router/route_generator.dart';

import 'package:bases_web/services/navigation_service.dart';

void main() {
  // Configuramos para usar nuestro locator (GetIt)
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RutasApp',
      initialRoute: '/stateful',
      // Esto ya no lo necesito, lo gestiona RouteGenerator
      // routes: {
      //   '/stateful': (_) => CounterPage(),
      //   '/provider': (_) => CounterProviderPage(),
      // },
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
      // Trabaja junto con onGenerateRoute.
      // Indicamos el layout.
      // Nos hace falta usar navigatorKey porque es quien tiene la referencia
      // a la navegación que este builder me está creando. Sin eso, al pulsar
      // en el menú de navegación no va a esa página.
      //
      // Usando el locator, hacemos que inyecte la instancia de NavigationService.
      navigatorKey: locator<NavigationService>().navigatorKey,
      builder: (_, child) {
        return MainLayoutPage(child: child ?? Container());
      },
    );
  }
}
