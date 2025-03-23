import 'package:dio/dio.dart';

import 'package:admin_dashboard/services/local_storage.dart';

// Clase adaptadora.
// Los métodos y propiedades serán estáticos para no tener que crear instancias.
class CafeApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    // Base del url
    _dio.options.baseUrl = 'http://localhost:8080/api';

    // Configurar Headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
    };
  }

  // Petición get centralizada.
  // path = Segmento que vamos a añadir al url.
  static Future httpGet(String path) async {
    try {
      // No necesitamos volver a llamar al método configureDio porque ya está
      // configurado en la instancia _dio.
      final resp = await _dio.get(path);
      return resp.data; // La data es el body de la respuesta.
    } catch (e) {
      throw ('Error en el GET: $e');
    }
  }

  // Petición post centralizada.
  // data = la información que se pasa en el body.
  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      // No necesitamos volver a llamar al método configureDio porque ya está
      // configurado en la instancia _dio.
      // Si no hubiera data vale mandarle un map vacío.
      final resp = await _dio.post(path, data: formData);
      return resp.data; // La data es el body de la respuesta.
    } catch (e) {
      throw ('Error en el POST: $e');
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      // No necesitamos volver a llamar al método configureDio porque ya está
      // configurado en la instancia _dio.
      // Si no hubiera data vale mandarle un map vacío.
      final resp = await _dio.put(path, data: formData);
      return resp.data; // La data es el body de la respuesta.
    } catch (e) {
      throw ('Error en el PUT: $e');
    }
  }

  // Nuestro back no espera ningún body, pero se deja configurado.
  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    
    try {
      // No necesitamos volver a llamar al método configureDio porque ya está
      // configurado en la instancia _dio.
      // Si no hubiera data vale mandarle un map vacío.
      final resp = await _dio.delete(path);
      return resp.data; // La data es el body de la respuesta.
    } catch (e) {
      throw ('Error en el DELETE: $e');
    }
  }
}
