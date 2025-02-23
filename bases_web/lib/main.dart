import 'package:flutter/material.dart';
import 'package:bases_web/ui/pages/counter_page.dart';
import 'package:bases_web/ui/pages/counter_provider_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RutasApp',
      // Voy a crear las rutas como lo haría normalmente en una app móvil, para ver el problema.
      initialRoute: '/stateful',
      routes: {
        '/stateful': ( _ ) => CounterPage(),
        '/provider': ( _ ) => CounterProviderPage()
      },
    );
  }
}
