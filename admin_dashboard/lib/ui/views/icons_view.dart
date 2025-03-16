import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class IconsView extends StatelessWidget {
  const IconsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        // Para que no rebote cuando se llega al final del scroll.
        physics: ClampingScrollPhysics(),
        children: [
          Text('Icons', style: CustomLabels.h1),
          
          SizedBox(height: 10),

          // Elementos uno al lado del otro. Cuando ya no quepan se van a la
          // siguiente linea.
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                width: 170,
                child: Center(child: Icon(Icons.ac_unit_outlined))
              ),

              WhiteCard(
                title: 'access_alarm_outlined',
                width: 170,
                child: Center(child: Icon(Icons.access_alarm_outlined))
              ),

              WhiteCard(
                title: 'access_time_rounded',
                width: 170,
                child: Center(child: Icon(Icons.access_time_rounded))
              ),

              WhiteCard(
                title: 'add_home_outlined',
                width: 170,
                child: Center(child: Icon(Icons.add_home_outlined))
              ),

              WhiteCard(
                title: 'all_inbox_outlined',
                width: 170,
                child: Center(child: Icon(Icons.all_inbox_outlined))
              ),

              WhiteCard(
                title: 'holiday_village_outlined',
                width: 170,
                child: Center(child: Icon(Icons.holiday_village_outlined))
              ),

              WhiteCard(
                title: 'dangerous_outlined',
                width: 170,
                child: Center(child: Icon(Icons.dangerous_outlined))
              ),
            ],
          )
        ],
      );
  }
}
