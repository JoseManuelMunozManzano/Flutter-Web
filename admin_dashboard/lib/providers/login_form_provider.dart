import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // Con esta key tendré acceso a mi formulario desde cualquier sitio.
  // Esta key tendremos que asociarla a la propiedad key del formulario de login_view.dart
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm() {
    // Aquí es donde lanzamos la validación del formulario.
    if (formKey.currentState!.validate()) {
      // print('Form valid ... Login');
      // print('$email === $password');
      return true;
    } else {
      // print('Form not valid');
      return false;
    }
  }
}
