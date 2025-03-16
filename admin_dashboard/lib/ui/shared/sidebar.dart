import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/menu_item.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SidemenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {

    final sidemenuProvider = Provider.of<SidemenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      // ListView permite scroll
      child: ListView(
        // Para evitar que rebote cuando se empuja el scroll más allá del límite.
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(height: 50),
          TextSeparator(text: 'main'),

          MenuItem(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
            isActive: sidemenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),

          MenuItem(text: 'Orders', icon: Icons.shopping_cart_outlined, onPressed: () {}),
          MenuItem(text: 'Analytic', icon: Icons.show_chart_outlined, onPressed: () {}),
          MenuItem(text: 'Categories', icon: Icons.layers_outlined, onPressed: () {}),
          MenuItem(text: 'Products', icon: Icons.dashboard_outlined, onPressed: () {}),
          MenuItem(text: 'Discount', icon: Icons.attach_money_outlined, onPressed: () {}),
          MenuItem(text: 'Customers', icon: Icons.people_alt_outlined, onPressed: () {}),

          SizedBox(height: 30),
          TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Icons',
            icon: Icons.list_alt_outlined,
            onPressed: () => navigateTo(Flurorouter.iconsRoute),
            isActive: sidemenuProvider.currentPage == Flurorouter.iconsRoute,
          ),
          MenuItem(text: 'Marketing', icon: Icons.mark_email_read_outlined, onPressed: () {}),
          MenuItem(text: 'Campaign', icon: Icons.note_add_outlined, onPressed: () {}),
          MenuItem(
            text: 'Blank',
            icon: Icons.post_add_outlined,
            onPressed: () => navigateTo(Flurorouter.blankRoute),
            isActive: sidemenuProvider.currentPage == Flurorouter.blankRoute,
          ),

          SizedBox(height: 50),
          TextSeparator(text: 'Exit'),
          MenuItem(text: 'Logout', icon: Icons.exit_to_app_outlined, onPressed: () {}),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xff092044),
        Color(0xff092042),
      ]
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
      ),
    ],
  );
}
