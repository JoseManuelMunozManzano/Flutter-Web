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
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // La personalización del Scrollbar se hace desde el tema global de la aplicación.
      // Ver main.dart
      body: Scrollbar(
        thumbVisibility: true,
        child: ListView(
          // Para que en modo móvil no se pueda arrastrar la página por
          // arriba ni por debajo.
          physics: ClampingScrollPhysics(),
          children: [
        
            (size.width > 1000)
            ? _DesktopBody(child: child)
            : _MobileBody(child: child),
        
            // LinksBar
            LinksBar(),
          ],
        ),
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {

  final Widget child;

  const _MobileBody({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),

          SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundTwitter()
          )
        ],
      )
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
      color: Colors.black,
      child: Row(
        children: [
          // Twitter Background
          // Ancho dinámico
          BackgroundTwitter(),

          // View Container (la vista basada en el URL)
          // Ancho estático
          Container(
            width: 600,
            height:
                double
                    .infinity, // Podemos usarlo porque sabemos el height del Container padre.
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(height: 20),
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
