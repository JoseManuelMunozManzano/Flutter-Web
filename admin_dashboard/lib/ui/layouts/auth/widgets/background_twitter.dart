import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: buildBoxDecoration(),
        child: Container(
          // Cuando se alcanzan estos límites, el icono de twitter empieza
          // a hacerse más pequeño
          constraints: BoxConstraints(maxWidth: 400),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image(
                  image: AssetImage('twitter-white-logo.png'),
                  width: 400,
                ),
              )
            )
        ),
      )
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        image: DecorationImage(
          // Notar que en la imagen no se indica assets.
          image: AssetImage('twitter-bg.png'),
          fit: BoxFit.cover,
        )
      );
  }
}
