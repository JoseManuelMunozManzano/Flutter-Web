import 'package:flutter/cupertino.dart';

class NavigationService {

  // Es este tipo porque en main.dart, navigatorKey es de este tipo.
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Maneja el historial.
  static navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  // La nueva pantalla le cae encima a la anterior.
  // Útil cuando entramos al Dashboard para no regresar al login.
  static replaceTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
