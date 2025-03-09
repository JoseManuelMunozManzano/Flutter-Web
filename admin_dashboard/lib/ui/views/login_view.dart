import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

// Recordar que las vistas no tienen un Scaffold
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        // Más grande que 370px el tamaño será de 370px.
        // Más pequeño que 370px, se va a adaptar.
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [

                // Email
                TextFormField(
                  //validator: (),
                  style: TextStyle(color: Colors.white),
                  decoration: buildInputDecoration(
                    hint: 'Ingrese su correo',
                    label: 'Email',
                    icon: Icons.email_outlined
                  ),
                ),

                SizedBox(height: 20,),

                // Password
                TextFormField(
                  //validator: (),
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: buildInputDecoration(
                    hint: '**********',
                    label: 'Contraseña',
                    icon: Icons.lock_outline_rounded
                  ),
                ),

                SizedBox(height: 20),
                LinkText(
                  text: 'Nueva cuenta',
                  onPressed: () {
                    // TODO: ir a registro
                  },
                ),
              ],
            )
          ),
        ),
      )
    );
  }

  InputDecoration buildInputDecoration({
    required String hint,
    required String label,
    required IconData icon
  }) {

    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue.withValues(alpha: 0.6)),
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey),
      labelStyle: TextStyle(color: Colors.grey),
      hintStyle: TextStyle(color: Colors.grey),
    );
  } 
    
}
