import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Centralizamos aquí la creación de labels.
// La idea de hacer todos los métodos estáticos es no tener que estar
// inicializando objetos.
class CustomLabels {
  static TextStyle h1 = GoogleFonts.roboto(
    fontSize: 30,
    fontWeight: FontWeight.w400
  );
}
