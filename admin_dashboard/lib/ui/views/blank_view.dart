import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // Para que no rebote cuando se llega al final del scroll.
        physics: ClampingScrollPhysics(),
        children: [
          Text('Blank View', style: CustomLabels.h1),
          
          SizedBox(height: 10),

          WhiteCard(
            title: 'Blank',
            child: Text('Hola mundo!!'),
          ),
        ],
      );
  }
}
