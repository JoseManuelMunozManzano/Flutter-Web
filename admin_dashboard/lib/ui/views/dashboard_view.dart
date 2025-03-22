import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AuthProvider>(context).user!;

    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // Para que no rebote cuando se llega al final del scroll.
        physics: ClampingScrollPhysics(),
        children: [
          Text('Dashboard View', style: CustomLabels.h1),
          
          SizedBox(height: 10),

          WhiteCard(
            title: user.nombre,
            child: Text(user.correo),
          ),
        ],
      );
  }
}
