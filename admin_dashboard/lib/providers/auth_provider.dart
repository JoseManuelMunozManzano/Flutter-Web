import 'package:flutter/material.dart';

// Provider Global
// Porque tenemos que saber en toda la app si el usuario esta autenticado y quien es.

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password) {
    // TODO: Petición http

    _token = 'sfkjsdakldshfjashkfd.jkdsfhjadhsjk';
    print('almacenar JWT: $_token');

    // TODO: Navegar al dashboard

    // Para que se redibuje donde deba redibujarse.
    notifyListeners();
  }
}
