import 'package:flutter/cupertino.dart';

class NavigationService {

  // Es este tipo porque en main.dart, navigatorKey es de este tipo.
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Maneja el historial. Mantiene activas las pantallas anteriores.
  // La usaremos si pensamos que se puede regresar a la pantalla anterior.
  static navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  // La nueva pantalla reemplaza a la anterior. La anterior se destruye.
  // Útil cuando entramos al Dashboard para no regresar al login.
  // Es la que suele usarse en web.
  static replaceTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
