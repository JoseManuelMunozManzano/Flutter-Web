import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/widgets/navbar_avatar.dart';
import 'package:admin_dashboard/ui/shared/widgets/notifications_indicator.dart';
import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [

          // Si queremos que el if afecte a más de una sentencia, se crea
          // un arreglo y se desestructura el resultado.
          // Aquí no la necesitamos, pero queda el código como consulta
          //
          // if (size.width <= 700)
          // ...[
          //   IconButton(icon: Icon(Icons.menu_outlined), onPressed: () {}),
          //   SizedBox(width: 5),
          // ],

          if (size.width <= 700)
            IconButton(icon: Icon(Icons.menu_outlined), onPressed: () {}),
          SizedBox(width: 5),

          // Search Input
          // Usamos un tamaño máximo. Si el tamaño es más pequeño es responsive.
          // pero no se hace más grande que el tamaño máximo.
          if (size.width > 390)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),

          // Coge el espacio restante que dejan todos los widgets.
          Spacer(),

          NotificationsIndicator(),
          SizedBox(width: 10),
          NavbarAvatar(),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
  );
}
