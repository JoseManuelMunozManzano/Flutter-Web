import 'package:flutter/material.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/models/usuario.dart';

class UsersDTS extends DataTableSource {

  final List<Usuario> users;

  UsersDTS(this.users);

  // Como se construye una fila.
  @override
  DataRow getRow(int index) {

    final Usuario user = users[index];

    // Indicamos aquí no-image porque no todos los usuarios tienen imagen
    final image = (user.img == null)
      ? Image(image: AssetImage('no-image.jpg'), width: 35, height: 35)
      : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!, width: 35, height: 35);

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(ClipOval(child: image)),
        DataCell(Text(user.nombre)),
        DataCell(Text(user.correo)),
        DataCell(Text(user.uid)),
        DataCell(
          IconButton(
            icon: Icon(Icons.edit_outlined),
            onPressed: () {
              NavigationService.replaceTo('/dashboard/users/${user.uid}');
            },
          )
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
