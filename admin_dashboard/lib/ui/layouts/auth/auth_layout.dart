import 'package:flutter/material.dart';

// Recordar que los layouts tienen un Scaffold
class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Auth Layout')
      ),
    );
  }
}
