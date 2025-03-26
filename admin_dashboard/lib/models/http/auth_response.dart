import 'dart:convert';

import 'package:admin_dashboard/models/usuario.dart';

class AuthResponse {
  Usuario usuario;
  String token;

  AuthResponse({required this.usuario, required this.token});

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  // A esto es a lo que llamamos.
  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
    usuario: Usuario.fromMap(json["usuario"]),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {"usuario": usuario.toMap(), "token": token};
}
