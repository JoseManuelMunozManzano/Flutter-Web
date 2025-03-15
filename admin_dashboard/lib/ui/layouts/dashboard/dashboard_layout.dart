import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatelessWidget {
  // El child que mostraremos en alguna parte del layout.
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Row(
        children: [

          // TODO: Esto depende si es más de 700px
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
      )
    );
  }
}
