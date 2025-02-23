import 'package:flutter/material.dart';
import 'package:bases_web/ui/router/route_generator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'RutasApp',
      routerConfig: routeGenerator,
    );
  }
}
