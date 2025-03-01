import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_landing_page/ui/shared/custom_menu_item.dart';

// Como vamos a hacer una animación, sabemos que vamos a necesitar un estado,
// para saber si el menú está abierto o cerrado.
// Como solo es una variable de estado no vamos a usar un provider.
class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

// Para que funcione el vsync: this de AnimationController tenemos que añadir
// with SingleTickerProviderStateMixin
class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Para que, cuando nos posicionemos en el menú, cambie el cursor
      // y sepamos que se puede hacer click.
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),

              // De manera condicional renderizamos estos elementos.
              // Usamos el operador spread para desestructurar y esparcir
              // cada uno de los items como si fueran hijos directos
              // del children.
              if (isOpen)
                  ...[
                    CustomMenuItem(text: 'Home', onPressed: () {}),
                    CustomMenuItem(text: 'About', onPressed: () {}),
                    CustomMenuItem(text: 'Pricing', onPressed: () {}),
                    CustomMenuItem(text: 'Contact', onPressed: () {}),
                    CustomMenuItem(text: 'Location', onPressed: () {}),
                    SizedBox(height: 8,)
                  ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({required this.isOpen, required this.controller});

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    // Envolvemos el Row en un Container para poder centrarlo.
    // Lo hemos centrado indicando el tamaño del Container.
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          // Para hacer que el texto se mueva al centro.
          // Para que se lance, necesitamos un cambio de estado, es decir,
          // antes tenía un width de un tamaño y ahora tiene otro width.
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 50 : 0,
          ),
          Text(
            'Menú',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
          ),
          // El spacer toma todo el espacio restante y empuja a sus hijos.
          Spacer(),
          // Para hacer la animación del Icon.
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
