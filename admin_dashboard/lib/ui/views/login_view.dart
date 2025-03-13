import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/router/router.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';

// Recordar que las vistas no tienen un Scaffold
class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    // Hacemos que nuestro provider login_form_provider.dart esté solo en este view.
    // Esto es porque no vamos a necesitar acceder a este estado una vez hagamos login.
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(authProvider),
      // Usando Builder, lo que conseguimos es construir todo lo que está antes de
      // dicho Builder y luego el Builder construye su Widget.
      // Lo bueno es que nos deja montar loginFormProvider y ya lo tenemos listo para usar.
      // Esto es porque ya existe en el context del builder ya que lo hemos creado (el create)
      // Sin el Builder nos daría el error:
      // Another exception was thrown: Error: Could not find the correct Provider<LoginFormProvider> above this LoginView Widget
      child: Builder(
        builder: (context) {
          final loginFormProvider = Provider.of<LoginFormProvider>(
            context,
            listen: false,
          );

          return Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              // Más grande que 370px el tamaño será de 370px.
              // Más pequeño que 370px, se va a adaptar.
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  // Con esta nueva propiedad se lanza automáticamente la validación.
                  autovalidateMode: AutovalidateMode.always,
                  // Disparando la validación.
                  // Forma 1: Asociar el formulario con su key a una propiedad con la que
                  //    vamos a tener control absoluto del formulario.
                  //    El problema es que el key debería estar en algún sitio centralizado
                  //    para poder usarlo en otros archivos.
                  //    Por suerte, esto ya lo tenemos definido. Es nuestro login_form_provider.dart
                  //    Y con esto, ya tenemos acceso en el provider acceso a todo el estado del formulario.
                  // Forma 2: Con AutovalidateMode arriba indicado se lanza la validación automáticamente.
                  // Estas dos formas se pueden usar juntas.
                  key: loginFormProvider.formKey,
                  child: Column(
                    children: [
                      // Email
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? ''))
                            return 'Email no válido';

                          return null;
                        },
                        // Se dispara cada vez que cambia el valor de la caja de texto.
                        onChanged: (value) => loginFormProvider.email = value,
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
                        // Esta validación se lanza desde el provider.
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Ingrese su contraseña';
                          if (value.length < 6)
                            return 'La contraseña debe de ser de al menos 6 caracteres';

                          return null; // Válido
                        },
                        // Se dispara cada vez que cambia el valor de la caja de texto.
                        onChanged:
                            (value) => loginFormProvider.password = value,
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
                          // Con el key, ya puedo usar el provider.
                          loginFormProvider.validateForm();
                        },
                        text: 'Ingresar',
                      ),

                      SizedBox(height: 20),
                      LinkText(
                        text: 'Nueva cuenta',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Flurorouter.registerRoute,
                          );
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
