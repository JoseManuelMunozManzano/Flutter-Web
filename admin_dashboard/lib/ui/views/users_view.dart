import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/datatables/users_datasource.dart';

import 'package:admin_dashboard/providers/users_provider.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {

    final usersProvider = Provider.of<UsersProvider>(context);
    final usersDataSource = UsersDTS(usersProvider.users);

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // Para que no rebote cuando se llega al final del scroll.
      physics: ClampingScrollPhysics(),
      children: [
        Text('Users View', style: CustomLabels.h1),

        SizedBox(height: 10),

        PaginatedDataTable(
          columns: [
            DataColumn(label: Text('Avatar')),
            // Lo hacemos ordenable
            DataColumn(label: Text('Nombre'), onSort: (colIndex, _) {
              usersProvider.sort<String>((user) => user.nombre);
            }),
            DataColumn(label: Text('Email'), onSort: (colIndex, _) {
              usersProvider.sort<String>((user) => user.correo);
            }),
            DataColumn(label: Text('UID')),
            DataColumn(label: Text('Acciones')),
          ],
          source: usersDataSource,
        ),
      ],
    );
  }
}
