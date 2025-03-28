import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/users_provider.dart';
import 'package:admin_dashboard/models/usuario.dart';

import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';

class UserView extends StatefulWidget {
  final String uid;

  const UserView({super.key, required this.uid});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);

    usersProvider.getUserById(widget.uid)
    .then((userDB) => setState(() {
      user = userDB;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      // Para que no rebote cuando se llega al final del scroll.
      physics: ClampingScrollPhysics(),
      children: [
        Text('User View', style: CustomLabels.h1),

        SizedBox(height: 10),

        if (user == null)
          WhiteCard(
            child: Container(
              alignment: Alignment.center,
              height: 300,
              child: CircularProgressIndicator(),
            ),
          ),

        if (user != null)
          _UserViewBody()
      ],
    );
  }
}

class _UserViewBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        // Si no indicamos esta propiedad, el ancho de las columnas
        // por defecto es el mismo para cada celda.
        // Una vez indicada un ancho, si no se indican más anchos, por defecto
        // para el resto de celdas toma todo el ancho de forma equitativa.
        columnWidths: {
          0: FixedColumnWidth(250)
        },
        // TODO: Ancho de la columna
        children: [
          TableRow(
            children: [
              // TODO: Avatar
              Container(
                width: 250,
                height: 200,
                color: Colors.red,
              ),

              // TODO: Formulario de actualización
              Container(
                height: 200,
                color: Colors.green,
              ),
            ]
          )
        ],
      ),
    );
  }
}
