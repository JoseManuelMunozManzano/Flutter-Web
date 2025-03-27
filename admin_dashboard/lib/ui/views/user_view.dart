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
      ],
    );
  }
}
