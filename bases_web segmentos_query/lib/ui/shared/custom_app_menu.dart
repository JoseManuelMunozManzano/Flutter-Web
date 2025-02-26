import 'package:bases_web/locator.dart';
import 'package:bases_web/services/navigation_service.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // En función del tamaño de pantalla devuelvo la clase de Tablet/Desktop o la de Mobile.
    // Devuelvo un layout builder. Usar el snippet layoutBldr.
    return LayoutBuilder(
      builder:
          (_, BoxConstraints constraints) =>
              (constraints.maxWidth > 520)
                  ? _TabletDesktopMenu()
                  : _MobileMenu(),
    );
  }
}

class _TabletDesktopMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            text: 'Contador Stateful',
            onPressed:
                () => locator<NavigationService>().navigateTo('/stateful'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Contador Provider',
            onPressed:
                () => locator<NavigationService>().navigateTo('/provider'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Otra página',
            onPressed:
                () => locator<NavigationService>().navigateTo('/noexiste'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Stateful 100',
            onPressed:
                () => locator<NavigationService>().navigateTo('/stateful/100'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Provider 200',
            onPressed:
                () => locator<NavigationService>().navigateTo('/provider?q=200'),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

// Cuando sean menos de 520px
class _MobileMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFlatButton(
            text: 'Contador Stateful',
            onPressed:
                // Esto que funciona en view_404.dart, no podemos usarlo aquí.
                //() => Navigator.pushNamed(context, '/stateful'),
                // El menú de navegación se encuentra fuera del contexto normal y se
                // está construyendo la ruta usando el builder de main.dart y necesitamos
                // nuestro navigatorKey.
                () => locator<NavigationService>().navigateTo('/stateful'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Contador Provider',
            onPressed:
                () => locator<NavigationService>().navigateTo('/provider'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Otra página',
            onPressed:
                () => locator<NavigationService>().navigateTo('/noexiste'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Stateful 100',
            onPressed:
                () => locator<NavigationService>().navigateTo('/stateful/100'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Provider 200',
            onPressed:
                () =>
                    locator<NavigationService>().navigateTo('/provider?q=200'),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
