import 'package:flutter/material.dart';

class NotificationsService {

  // Para poder mostrar este snackbar necesito una referencia con mi app (una key).
  // Esto lo consigo en main.app, usando scaffoldMessengerKey.
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackbar = SnackBar(
      backgroundColor: Colors.red.withValues(alpha: 0.9),
      content: Text(message, style: TextStyle(color: Colors.white, fontSize: 20))
    );

    messengerKey.currentState!.showSnackBar(snackbar);
  }

  static showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackbar);
  }

  // Creamos un modal con un dialog
  static showBudyIndicator(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      content: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    // Para mostrarlo necesito acceso al context
    showDialog(
      context: context,
      builder: (_) => dialog
    );
  }
}
