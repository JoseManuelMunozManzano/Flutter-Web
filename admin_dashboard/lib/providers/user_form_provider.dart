import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  
  Usuario? user;
  // Con esta key tendré acceso a mi formulario desde cualquier sitio.
  // Esta key tendremos que asociarla a la propiedad key del formulario de login_view.dart
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Forma 1 de notificar a los listeners
  // Es la forma más simple, pero no es la que usamos en el proyecto.
  void updateListeners() {
    notifyListeners();
  }

  // Forma 2 de notificar a los listeners
  // Copio los valores del usuario
  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado,
      google: google ?? user!.google,
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      uid: uid ?? user!.uid,
    );
    notifyListeners();
  }

  bool _validForm() {
    return formKey.currentState!.validate();
  }

  updateUser() {
    if (!_validForm()) return;

    print('Info a postear');
    print(user!.nombre);
    print(user!.correo);
  }
}
