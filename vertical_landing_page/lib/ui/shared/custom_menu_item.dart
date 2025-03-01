import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Es un StatefulWidget porque, para hacer el efecto del hover
// necesitamos saber cuando el cursor está encima, cuando el mouse sale
// y hacer la transición para hacer ese efecto.
//
// Pasamos el texto y la función con la acción a realizar cuando
// se haga click en el menú.
class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;

  const CustomMenuItem({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // onEnter y onExit son los que cambian mi estado y hace que
      // se haga la animación.
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: () => widget.onPressed(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: 150,
          height: 50,
          color: isHover ? Colors.pinkAccent : Colors.black,
          child: Center(
            child: Text(
              widget.text,
              style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
            ),
          )
        )
      ),
    );
  }
}
