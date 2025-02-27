import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

// La diferencia entre un View y un Layout es que el View NO tiene Scaffold
class View404 extends StatelessWidget {
  const View404({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '404',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('No se encontró la página', style: TextStyle(fontSize: 20)),
            CustomFlatButton(
              text: 'Regresar',
              // Esto sigue funcionando porque estamos dentro del contexto normal.
              // Estamos dentro del contenedor de la ruta. Sabe donde se encuentra
              // el router y tiene la referencia al mismo.
              onPressed: () => Navigator.pushNamed(context, '/stateful'),
            ),
          ],
        ),
      ),
    );
  }
}
