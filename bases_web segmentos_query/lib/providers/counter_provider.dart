import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {

  // Valor si no se puede parsear la base.
  int _counter = 15;

  CounterProvider(String base) {
    if (int.tryParse(base) != null) {
      _counter = int.parse(base);
    }
  }

  get counter => _counter;

  void increment() {
    _counter++;
    // Con este notify, cuando counter cambia, se indica a los listener
    // que redibujen el Widget.
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
