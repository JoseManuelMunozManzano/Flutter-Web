import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/category.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';

// Es con estado porque tenemos que mantener el estado de un campo de texto.
// Como solo tenemos que mantener un campo no merece la pena hacer un provider.
class CategoryModal extends StatefulWidget {
  // Este modal nos va a servir para crear una categoría o actualizar una ya existente.
  final Category? categoria;

  const CategoryModal({super.key, this.categoria});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String nombre = '';
  String? id;

  @override
  void initState() {
    super.initState();

    id = widget.categoria?.id;
    nombre = widget.categoria?.nombre ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 500,
      width: double.infinity,
      decoration: buildBoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.categoria?.nombre ?? 'Nueva categoría', style: CustomLabels.h1.copyWith(color: Colors.white)),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.close, color: Colors.white)
              )
            ],
          ), 

          Divider(color: Colors.white.withValues(alpha: 0.3)),

          SizedBox(height: 20),

          TextFormField(
            initialValue: widget.categoria?.nombre ?? '',
            // No quiero redibujar, por eso no uso setState()
            onChanged: (value) => nombre = value,
            decoration: CustomInputs.loginInputDecoration(
              hint: 'Nombre de la categoría',
              label: 'Categoría',
              icon: Icons.new_releases_outlined,
            ),
            style: TextStyle(color: Colors.white),
          ),

          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: CustomOutlinedButton(
              onPressed: () async {
                
              },
              text: 'Guardar',
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    color: Color(0xff0f2041),
    boxShadow: [
      BoxShadow(
        color: Colors.black26
      )
    ]
  );
}
