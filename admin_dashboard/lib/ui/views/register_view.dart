import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';

// Recordar que las vistas no tienen un Scaffold
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);

          return Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              // Más grande que 370px el tamaño será de 370px.
              // Más pequeño que 370px, se va a adaptar.
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      // Nombre
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese su nombre';
                          if (value.length < 5) return 'El nombre debe ser de al menos 5 caracteres';

                          return null;
                        },
                        onChanged: (value) => registerFormProvider.name = value,
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
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) return 'Email no válido';

                          return null;
                        },
                        onChanged: (value) => registerFormProvider.email = value,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su correo',
                          label: 'Email',
                          icon: Icons.email_outlined,
                        ),
                      ),

                      SizedBox(height: 20),

                      // Password
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Ingrese su contraseña';
                          if (value.length < 6) return 'La contraseña debe de ser de al menos 6 caracteres';

                          return null; // Válido
                        },
                        onChanged: (value) => registerFormProvider.password = value,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: '**********',
                          label: 'Contraseña',
                          icon: Icons.lock_outline_rounded,
                        ),
                      ),

                      SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          registerFormProvider.validateForm();
                        },
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
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
