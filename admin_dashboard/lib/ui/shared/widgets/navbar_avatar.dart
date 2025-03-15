import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    // Hace la imagen circular.
    return ClipOval(
      child: SizedBox(
        width: 30,
        height: 30,
        child: Image.asset('mi-foto.jpg'),
      ),
    );
  }
}
