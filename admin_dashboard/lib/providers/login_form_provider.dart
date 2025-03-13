import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // Con esta key tendré acceso a mi formulario desde cualquier sitio.
  // Esta key tendremos que asociarla a la propiedad key del formulario de login_view.dart
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthProvider authProvider;

  String email = '';
  String password = '';

  LoginFormProvider(this.authProvider);

  validateForm() {
    // Aquí es donde lanzamos la validación del formulario.
    if (formKey.currentState!.validate()) {
      print('Form valid ... Login');
      print('$email === $password');

      authProvider.login(email, password);

    } else {
      print('Form not valid');
    }
  }
}
