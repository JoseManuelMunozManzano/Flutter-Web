import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

// Provider Global
// Porque tenemos que saber en toda la app si el usuario esta autenticado y quien es.
class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    // Tomamos esta información y creamos el objeto que pasaremos como body
    // al backend.
    final data = {'correo': email, 'password': password};

    CafeApi.post('/auth/login', data)
      .then((json) {
        final authReponse = AuthResponse.fromMap(json);
        user = authReponse.usuario;

        authStatus = AuthStatus.authenticated;
        // Grabamos el LocalStorage
        LocalStorage.prefs.setString('token', authReponse.token);
        NavigationService.replaceTo(Flurorouter.dashboardRoute);
        // Para que se redibuje donde deba redibujarse.
        notifyListeners();

      })
      .catchError((e) {
        NotificationsService.showSnackbarError('Usuario / Password no válidos');
      });

  }

  register(String email, String password, String name) {
    // Tomamos esta información y creamos el objeto que pasaremos como body
    // al backend.
    final data = {'nombre': name, 'correo': email, 'password': password};

    // Se hace el .then() porque el post devuelve un Future.
    CafeApi.post('/usuarios', data)
        .then((json) {
          // print(json);
          // Serializamos el json
          final authResponse = AuthResponse.fromMap(json);
          user = authResponse.usuario;

          // Grabamos el LocalStorage
          authStatus = AuthStatus.authenticated;
          LocalStorage.prefs.setString('token', authResponse.token);
          NavigationService.replaceTo(Flurorouter.dashboardRoute);
          notifyListeners();
        })
        .catchError((e) {
          NotificationsService.showSnackbarError('Usuario / Password no válidos');
        });
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
