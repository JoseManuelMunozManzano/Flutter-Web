import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/shared/widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          // TODO: Icono del menú
          IconButton(icon: Icon(Icons.menu_outlined), onPressed: (){}),
          SizedBox(width: 5),

          // Search Input
          // Usamos un tamaño máximo. Si el tamaño es más pequeño es responsive.
          // pero no se hace más grande que el tamaño máximo.
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250),
            child: SearchText(),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5,
      )
    ]
  );
}
