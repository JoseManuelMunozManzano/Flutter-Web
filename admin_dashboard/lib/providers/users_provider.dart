import 'package:admin_dashboard/models/http/users_response.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/api/cafe_api.dart';

import 'package:admin_dashboard/models/usuario.dart';

class UsersProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? sortColumnIndex;

  UsersProvider() {
    // Para que, nada más crearse una instancia de esta clase,
    // guarde los datos en el List
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromMap(resp);

    users = [...usersResponse.usuarios];

    isLoading = false;

    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      // La función nos va a retornar el campo que queremos obtener.
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    // El sort() cambia el arreglo por lo que volveremos a redibujar.
    notifyListeners();
  }
}
