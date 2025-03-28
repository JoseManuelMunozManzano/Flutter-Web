import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/usuario.dart';

class UserFormProvider extends ChangeNotifier {
  
  Usuario? user;
  // Con esta key tendré acceso a mi formulario desde cualquier sitio.
  // Esta key tendremos que asociarla a la propiedad key del formulario de login_view.dart
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TODO: pensar como voy a actualizar el usuario del provider

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
