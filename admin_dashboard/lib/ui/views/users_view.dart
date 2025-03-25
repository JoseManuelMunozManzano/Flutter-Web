import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // Para que no rebote cuando se llega al final del scroll.
        physics: ClampingScrollPhysics(),
        children: [
          Text('Users View', style: CustomLabels.h1),
          
          SizedBox(height: 10),

          WhiteCard(
            title: 'Users View',
            child: Text('Hola mundo!!'),
          ),
        ],
      );
  }
}
