import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  // Estos son los URLs que necesitamos, y están en el mismo orden en el que viene
  // index en la función goTo
  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location',
  ];

  // El argumento routeName lo voy a usar para saber cual es la posición índice
  // basando en el arreglo _pages.
  createScrollController(String routeName) {
    // Me creo un nuevo PageController porque cuando se invoca a esta función NO
    // tenemos instancia de HomePage y por lo tanto no tenemos el
    // scrollController declarado arriba.
    // También nos viene muy bien el poder indicar la página inicial.
    scrollController = PageController(initialPage: _getPageIndex(routeName));
  }

  int _getPageIndex(String routeName) {
    return !_pages.contains(routeName) ? 0 : _pages.indexOf(routeName);
  }

  // El menú va a llamar aquí y esta función va a mover el scrollController.
  // También va a modificar mi URL.
  goTo(int index) {
    // final routeName = _pages[index];
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
