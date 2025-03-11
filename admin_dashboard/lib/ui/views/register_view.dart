import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';

// Recordar que las vistas no tienen un Scaffold
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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

                // Nombre
                TextFormField(
                  //validator: (),
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
                    hint: 'Ingrese su nombre',
                    label: 'Nombre',
                    icon: Icons.supervised_user_circle_sharp,
                  ),
                ),

                SizedBox(height: 20),

                // Email
                TextFormField(
                  //validator: (),
                  style: TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecoration(
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
                  decoration: CustomInputs.loginInputDecoration(
                    hint: '**********',
                    label: 'Contraseña',
                    icon: Icons.lock_outline_rounded
                  ),
                ),

                SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: () {},
                  text: 'Crear cuenta',
                ),

                SizedBox(height: 20),
                LinkText(
                  text: 'Ir al login',
                  onPressed: () {
                    Navigator.pushNamed(context, Flurorouter.loginRoute);
                  },
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}
