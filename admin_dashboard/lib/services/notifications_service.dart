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
}
