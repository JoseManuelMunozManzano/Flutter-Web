import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 15;

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
