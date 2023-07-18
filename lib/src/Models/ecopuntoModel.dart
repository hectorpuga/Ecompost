import 'dart:convert';

class Ecopunto {
  Ecopunto({
    required this.id,
    required this.idCreador,
    required this.nombreE,
    required this.telefono,
    required this.tipoDesecho,
    required this.longitud,
    required this.latitud,
    required this.diaEntrada,
    required this.diaSalida,
    required this.horaEntrada,
    required this.horaSalida,
    required this.secure_url
  });

  String id;  
  String idCreador;
  String nombreE;
  String telefono;
  String tipoDesecho;
  String longitud;
  String latitud;
  String diaEntrada;
  String diaSalida;
  String horaEntrada;
  String horaSalida;
  Object secure_url;

  factory Ecopunto.fromJson(String str) => Ecopunto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ecopunto.fromMap(Map<String, dynamic> json) => Ecopunto(
        id: json["id"],
        idCreador: json["idCreador"],
        nombreE: json["nombreE"],
        telefono: json["Telefono"],
        tipoDesecho: json["TipoDesecho"],
        longitud:  json["Longitud"],
        latitud: json["Latitud"],
        diaEntrada: json["DiaEntrada"],
        diaSalida: json["DiaSalida"],
        horaEntrada: json["HoraEntrada"],
        horaSalida: json["HoraSalida"],
        secure_url: json["secure_url"]

      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "idCreador": idCreador,
        "nombreE": nombreE,
        "Telefono": telefono,
        "TipoDesecho": tipoDesecho,
        "Longitud": longitud,
        "Latitud": latitud,
        "DiaEntrada": diaEntrada,
        "DiaSalida": diaSalida,
        "HoraEntrada": horaEntrada,
        "HoraSalida": horaSalida,
        "secure_url": secure_url
      };
}
