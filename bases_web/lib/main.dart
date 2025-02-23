import 'package:flutter/material.dart';
import 'package:bases_web/ui/router/router_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'RutasApp',
      // Voy a crear las rutas como lo haría normalmente en una app móvil, para ver el problema.
      // initialRoute: '/stateful',
      // Una vez visto el problema, se comenta porque no nos hace falta.
      // routes: {
      //   '/stateful': ( _ ) => CounterPage(),
      //   '/provider': ( _ ) => CounterProviderPage()
      // },

      // Ahora esto nos funciona nuestra navegación.
      routerConfig: routerGenerator,
    );
  }
}
