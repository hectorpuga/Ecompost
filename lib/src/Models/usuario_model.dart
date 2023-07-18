import 'dart:convert';

class Usuario {
  Usuario(
      {required this.id,
      required this.nombre,
      required this.correo,
      required this.password,
      required this.secure_url});

  String id;
  String nombre;
  String correo;
  String password;
  String secure_url;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
      id: json["id"],
      nombre: json["nombre"],
      correo: json["Correo"],
      password: json["password"],
      secure_url: json["secure_url"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "Correo": correo,
        "password": password,
        "secure_url": secure_url
      };
}
