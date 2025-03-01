import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Como vamos a hacer una animación, sabemos que vamos a necesitar un estado,
// para saber si el menú está abierto o cerrado.
// Como solo es una variable de estado no vamos a usar un provider.
//
// Pero por ahora lo vamos a crear como un StatelessWidget y luego lo cambiamos.
class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Para que, cuando nos posicionemos en el menú, cambie el cursor
      // y sepamos que se puede hacer click.
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {print('click');},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: 50,
          color: Colors.black,
          child: Row(
            children: [
              Text('Menú', style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
              // El spacer toma todo el espacio restante y empuja a sus hijos.
              Spacer(),
              Icon(Icons.menu, color: Colors.white)
            ],
          )
        ),
      ),
    );
  }
}
