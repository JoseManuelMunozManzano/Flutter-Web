import 'package:flutter/material.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';

class CounterView extends StatefulWidget {
  final String base;

  const CounterView({super.key, required this.base});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  // Por desgracia no se puede asignar un valor de la instancia widget en este punto
  // de la inicialización.
  // int counter = widget.base;
  int counter = 10;

  // Antes de que se construya un Widget siempre tengo el initState.
  // Aquí si que puedo asignar un valor de la instancia widget.  
  @override
  void initState() {
    super.initState();
    // Esto en teoría funciona.
    // Pero puede que una persona escriba en el URL un segmento de texto
    // y aquí espero un número. Tratamos este problema.
    // Si no se puede parsear a int, arriba counter sigue indicando que valdrá 10.
    // También se podría sacar al usuario de esta pantalla.
    if (int.tryParse(widget.base) != null) {
      counter = int.parse(widget.base);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),

        Text('Stateful Counter', style: TextStyle(fontSize: 20)),

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
    );
  }
}
