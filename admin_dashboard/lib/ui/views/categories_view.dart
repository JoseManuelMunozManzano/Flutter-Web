import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Para que no rebote cuando se llega al final del scroll.
      physics: ClampingScrollPhysics(),
      children: [
        Text('Categorías', style: CustomLabels.h1),

        SizedBox(height: 10),

        WhiteCard(title: 'Categorías', child: Text('Hola mundo!!')),
      ],
    );
  }
}
