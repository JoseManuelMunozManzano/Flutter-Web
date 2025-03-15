import 'package:flutter/material.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Para colocar unos Widgets encima de otros.
      child: Stack(
        children: [
          Icon(Icons.notifications_none_outlined, color: Colors.grey),
          // Punto rojo que indica que hay una notificación.
          Positioned(
            left: 2,
            child: Container(
              width: 5,
              height: 5,
              decoration: buildBoxDecoration(),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(100)
  );
}
