import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/layouts/auth/widgets/background_twitter.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';

// Recordar que los layouts tienen un Scaffold
class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        // Para que en modo móvil no se pueda arrastrar la página por
        // arriba ni por debajo.
        physics: ClampingScrollPhysics(),
        children: [
          // Dektop
          _DesktopBody(child: child),
          // Mobile

          // LinksBar
          LinksBar(),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({required this.child});

  @override
  Widget build(BuildContext context) {
    // Para poder hacer scroll en un ListView sus hijos tienen que tener un tamaño específico.
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.red,
      child: Row(
        children: [
          // Twitter Background
          // Ancho dinámico
          BackgroundTwitter(),

          // View Container (la vista basada en el URL)
          // Ancho estático
          Container(
            width: 600,
            height:double.infinity, // Podemos usarlo porque sabemos el height del Container padre.
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(height: 20,),
                CustomTitle(),
                SizedBox(height: 50),
                // El espacio sobrante va para mi vista de login o register.
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
