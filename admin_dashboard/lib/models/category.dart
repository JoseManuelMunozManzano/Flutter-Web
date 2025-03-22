import 'dart:convert';

class Category {
  String id;
  String nombre;
  UserCategory usuario;

  Category({required this.id, required this.nombre, required this.usuario});

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json["_id"],
    nombre: json["nombre"],
    usuario: UserCategory.fromMap(json["usuario"]),
  );

  Map<String, dynamic> toMap() => {
    "_id": id,
    "nombre": nombre,
    "usuario": usuario.toMap(),
  };

  @override
  String toString() {
    return 'Categoría: $nombre';
  }
}

class UserCategory {
  String id;
  String nombre;

  UserCategory({required this.id, required this.nombre});

  factory UserCategory.fromJson(String str) => UserCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserCategory.fromMap(Map<String, dynamic> json) =>
      UserCategory(id: json["_id"], nombre: json["nombre"]);

  Map<String, dynamic> toMap() => {"_id": id, "nombre": nombre};
}
