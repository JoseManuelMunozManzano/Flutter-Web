import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:vertical_landing_page/providers/page_provider.dart';

import 'package:vertical_landing_page/ui/shared/custom_app_menu.dart';

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
        // Este decoration ya no hace falta porque el estiramiento efecto móvil no puedo hacerlo
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [

            _HomeBody(),

            Positioned(
              right: 20,
              top: 20,
              child: CustomAppMenu(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Colors.pink,
        Colors.purpleAccent,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // Puntos de quiebre del gradiente.
      // En este ejemplo, esto hace los dos colores sólidos, uno en una mitad
      // de la pantalla y el otro en la otra mitad.
      stops: [ 0.5, 0.5]
    )
  );
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // La propiedad listen la ponemos a false para que no redibuje el Widget.
    // No necesitamos que se redibuje.
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      // Este controlador hace referencia a mi PageController del provider.      
      controller: pageProvider.scrollController,
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
