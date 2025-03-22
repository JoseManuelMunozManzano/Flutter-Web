import 'package:admin_dashboard/providers/sidemenu_provider.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/navbar.dart';
import 'package:admin_dashboard/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  // El child que mostraremos en alguna parte del layout.
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {

  // Para inicializar menuController de SidemenuProvider.
  // Recordar que se declaró con late.
  @override
  void initState() {
    super.initState();
    SidemenuProvider.menuController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );
  }

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
                    Expanded(
                      child: Container (
                        child: widget.child
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),

          if (size.width < 700)
            AnimatedBuilder(
              animation: SidemenuProvider.menuController,
              // El builder es la construcción de un Widget
              builder: (context, _) => Stack(
                children: [
                  
                  if (SidemenuProvider.isOpen)
                    Opacity(
                      opacity: SidemenuProvider.opacity.value,
                      child: GestureDetector(
                        onTap: () => SidemenuProvider.closeMenu(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black26
                        ),
                      )
                    ),

                  Transform.translate(
                    offset: Offset(SidemenuProvider.movement.value, 0),
                    child: Sidebar(),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
