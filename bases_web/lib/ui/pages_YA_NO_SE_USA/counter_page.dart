import 'package:bases_web/ui/shared/custom_app_menu.dart';
import 'package:flutter/material.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';

// En la parte de Flutter Web, los StatefulWidget son muy útiles.
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // El Spacer() nos ayuda a expandir el contenido.
          // Esto hace que CustomAppMenu() se sitúe en la parte
          // superior del navegador.
          // Sin el se coloca en el centro.
          // To-do el contador se posiciona al final del navegador.
          // Pero para evitar esto último, hemos colocado otro Spacer()
          // después del Widget Row.
          CustomAppMenu(),
          Spacer(),

          Text('Stateful Counter', style: TextStyle(fontSize: 20)),

          // Con este Widget, el texto se empieza a adaptar basado en el
          // espacio disponible (Responsive)
          // Para que el texto no quede muy pegado a los bordes usamos
          // un padding.
          FittedBox(
            fit: BoxFit.contain,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Contador: $counter',
                style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomFlatButton(
                text: 'Incrementar',
                onPressed: () => setState(() => counter++),
              ),

              CustomFlatButton(
                text: 'Decrementar',
                onPressed: () => setState(() => counter--),
              ),
            ],
          ),

          Spacer(),
        ],
      ),
    );
  }
}
