import 'package:flutter/material.dart';

// Forma fea de obtener el navigatorKey
//
// Esta clase la tengo que manejar como un Singleton para que en toda mi app
// tenga acceso a la misma instancia, es decir, solo quiero un key.
// Esto lo conseguimos haciendo la clase privada, aunque también se podría
// implementar con provider.
class _NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack(String routeName) {
    return navigatorKey.currentState!.pop(routeName);
  }
}

// Este es el único objeto que se importa.
// Esto no está mal, pero es difícil de controlar y de probar.
// Vamos a acabar cambiándolo por Get_it, que nos va a permitir inyectar dependencias
// de manera global.\
// Pero, de nuevo, no haría falta porque se podría hacer con provider, lo que pasa
// es que esta información no es un state que nos sirva para redibujar widgets.
final navigationService = _NavigationService();
