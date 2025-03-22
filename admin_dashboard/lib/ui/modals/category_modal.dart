import 'package:flutter/material.dart';

import 'package:admin_dashboard/models/category.dart';

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
      height: 500,
      width: double.infinity,
      decoration: buildBoxDecoration(),
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
