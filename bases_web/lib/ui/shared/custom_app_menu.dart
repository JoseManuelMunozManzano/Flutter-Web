import 'package:bases_web/ui/shared/custom_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            onPressed: () => context.push('/stateful'),
            color: Colors.black,
          ),

          SizedBox(width: 10,),

          CustomFlatButton(
            text: 'Contador Provider',
            onPressed: () => context.push('/provider'),
            color: Colors.black,
          ),

          SizedBox(width: 10),

          CustomFlatButton(
            text: 'Otra página',
            onPressed: () => context.push('/noexiste'),
            color: Colors.black,
          ),
        ],
      )
    );
  }
}
