import 'package:bases_web/services/navigation_service.dart';
import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CustomFlatButton(
            text: 'Contador Stateful',
            // Comentado deja la forma tradicional
            //onPressed: () => Navigator.pushNamed(context, '/stateful'),
            //
            // Usando nuestro navigatorKey
            onPressed: () => navigationService.navigateTo('/stateful'),
            color: Colors.black,
          ),

          SizedBox(width: 10,),

          CustomFlatButton(
            text: 'Contador Provider',
            // onPressed: () => Navigator.pushNamed(context, '/provider'),
            onPressed: () => navigationService.navigateTo('/provider'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Otra página',
            // onPressed: () => Navigator.pushNamed(context, '/noexiste'),
            onPressed: () => navigationService.navigateTo('/noexiste'),
            color: Colors.black,
          ),
        ],
      )
    );
  }
}
