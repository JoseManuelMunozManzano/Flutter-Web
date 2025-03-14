import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // En este momento no tiene un valor, pero lo tendrá cuando lo vaya a utilizar.
  static late SharedPreferences prefs;

  // Esta configuración es la misma que se hizo en main.dart, en Flurorouter.configureRoutes().
  // Antes de crear la aplicación configuramos las rutas.
  // Aquí con el LocalStorage es lo mismo.
  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
