import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
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
              // AVATAR
              _AvatarContainer(),

              // Formulario de actualización
              _UserViewForm(),
            ]
          )
        ],
      ),
    );
  }
}

class _UserViewForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Información general',
      child: Form(
        // TODO: Key
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [

            TextFormField(
              decoration: CustomInputs.formInputDecoration(
                hint: 'Nombre del usuario',
                label: 'Nombre',
                icon: Icons.supervised_user_circle_outlined,
              ),
            ),

            SizedBox(height: 20),

            TextFormField(
              decoration: CustomInputs.formInputDecoration(
                hint: 'Correo del usuario',
                label: 'Correo',
                icon: Icons.mark_email_read_outlined,
              ),              
            ),

            SizedBox(height: 20),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 130),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.indigo),
                  shadowColor: WidgetStatePropertyAll(Colors.transparent),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Row(
                  children: [
                    Icon(Icons.save_outlined, size: 20),
                    Text(' Guardar'),
                  ],
                )
              ),
            )
          ],
        )
      )
    );
  }
}

class _AvatarContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      // Aunque ya es de 250, al indicarlo en columnWidths, lo vamos a
      // poner aquí, aunque no haga falta.
      width: 250,
      child: SizedBox(
        // Para que centre, porque si no centra con respecto a la imagen.
        // Ahora el contenedor se expande y centra con respecto al contenedor.
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2),
            SizedBox(height: 20),

            SizedBox(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage('no-image.jpg')
                    ),
                  ),

                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        child: Icon(Icons.camera_alt_outlined, size: 20, color: Colors.white),
                        onPressed: () {
                          // TODO: Seleccionar la imagen
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Nombre de usuario',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ]
        ),
      )
    );
  }
}
