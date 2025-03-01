import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {

  PageController scrollController = PageController();

  // El menú va a llamar aquí y esta función va a mover el scrollController.
  goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
