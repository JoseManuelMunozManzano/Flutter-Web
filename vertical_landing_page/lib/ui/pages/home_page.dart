import 'package:flutter/material.dart';

import 'package:vertical_landing_page/ui/views/about_view.dart';
import 'package:vertical_landing_page/ui/views/contact_view.dart';
import 'package:vertical_landing_page/ui/views/home_view.dart';
import 'package:vertical_landing_page/ui/views/location_view.dart';
import 'package:vertical_landing_page/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // El container tiene la información del PageView, que es lo que me va a permitir
      // hacer el scroll.
      // Pero además, en la parte superior derecha, va a tener un menú en una posición
      // estática y superpuesto.
      // Para esto, tenemos que poner dos elementos, uno encima del otro. Usamos Stack
      body: Container(
        child: Stack(
          children: [

            _HomeBody(),

            Positioned(
              right: 20,
              top: 20,
              child: Container(width: 150, height: 50, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        // Aquí se van a mostrar las vistas.
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()
      ],
    );
  }
}
