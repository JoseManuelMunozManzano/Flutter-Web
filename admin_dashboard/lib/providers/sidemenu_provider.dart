import 'package:flutter/material.dart';

class SidemenuProvider extends ChangeNotifier {
  // Un AnimationController es como si fuera el control de reproducción de un
  // video en YouTube. Permite poner pausa, rebobinar...
  static late AnimationController menuController;
  static bool isOpen = false;

  String _currentPage = '';

  String get currentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(String routeName) {
    _currentPage = routeName;
    // La idea es que el redibujado no se haga hasta que se haya construido la página.
    Future.delayed(Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  // Movimiento de entrar y salir.
  // Se indica -200 porque el menú lateral tiene 200px de ancho.
  // Lo pongo en -200 para que esté en la izquierda, y 0 es su posición actual.
  static Animation<double> movement = Tween<double>(
    begin: -200,
    end: 0,
  ).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  // el 0 es totalmente transparente y el 1 es que el elemento es visible.
  static Animation<double> opacity = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));

  static void openMenu() {
    isOpen = true;
    // Se lanza la animación
    menuController.forward();
  }

  static void closeMenu() {
    isOpen = false;
    // Se lanza la animación
    menuController.reverse();
  }

  // No va a hacer falta en esta app.
  // Se indica aquí para saber como implementarlo.
  static void toggleMenu() {
    (isOpen) ? menuController.reverse() : menuController.forward();

    isOpen = !isOpen;
  }
}
