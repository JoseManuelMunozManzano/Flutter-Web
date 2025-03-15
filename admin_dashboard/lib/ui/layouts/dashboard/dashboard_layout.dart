import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  // El child que mostraremos en alguna parte del layout.
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      // Necesito un stack para que en dispositivos menores de 700px que aparezca
      // superpuesto el menú
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700)
                Sidebar(),
          
              Expanded(
                child: Column(
                  children: [
                    // Navbar
                    Navbar(),
          
                    // Contenedor de nuestra view
                    Expanded(child: child),
                  ],
                ),
              ),
            ],
          ),

          if (size.width < 700)
            Sidebar(),
        ],
      ),
    );
  }
}
