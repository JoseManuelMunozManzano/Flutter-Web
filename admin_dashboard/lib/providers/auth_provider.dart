import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

// Provider Global
// Porque tenemos que saber en toda la app si el usuario esta autenticado y quien es.
class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // TODO: Petición http
    _token = 'sfkjsdakldshfjashkfd.jkdsfhjadhsjk';
    LocalStorage.prefs.setString('token', _token!);

    // Para que se redibuje donde deba redibujarse.
    authStatus = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  register(String email, String password, String name) {
    // Tomamos esta información y creamos el objeto que pasaremos como body
    // al backend.
    final data = {
      'nombre': name,
      'correo': email,
      'password': password,
    };

    // Se hace el .then() porque el post devuelve un Future.
    CafeApi.post('/usuarios', data).then(
      (json) {
        print(json);
      }
    ).catchError((e) {
      print('Error en: $e');
      // TODO: Mostrar notificación de error
    });

    // authStatus = AuthStatus.authenticated;
    // LocalStorage.prefs.setString('token', _token!);
    // NavigationService.replaceTo(Flurorouter.dashboardRoute);
    // notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // TODO: ir al backend y comprobar si el JWT es válido

    // Esperamos un segundo para simular una petición muy lenta a un backend.
    await Future.delayed(Duration(milliseconds: 1000));

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
