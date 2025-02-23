import 'package:flutter/material.dart';
import 'package:bases_web/router/route_generator.dart';

void main() => runApp(const MyApp());

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
    );
  }
}
