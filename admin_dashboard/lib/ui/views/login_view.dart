import 'package:flutter/material.dart';

// Recordar que las vistas no tienen un Scaffold
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text('Login View')
      ),
    );
  }
}
