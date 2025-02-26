import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

// La diferencia entre un View y un Layout es que el View NO tiene Scaffold
class View404 extends StatelessWidget {
  const View404({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
            onPressed: () => Navigator.pushNamed(context, '/stateful'),
          ),
        ],
      ),
    );
  }
}
