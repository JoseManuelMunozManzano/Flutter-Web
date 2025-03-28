import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... Register');
      print('$name === $email === $password');
      return true;
    } else {
      print('Form not valid');
      return false;
    }
  }
}
