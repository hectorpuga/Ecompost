import 'dart:convert';
import 'ciudad.dart';

class Ciudades {
  Ciudades({
    required this.type,
    required this.query,
    required this.result,
  });

  String type;
  List<String> query;
  List<Ciudad> result;

  factory Ciudades.fromJson(String str) => Ciudades.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ciudades.fromMap(Map<String, dynamic> json) => Ciudades(
        type: json["type"],
        query: List<String>.from(json["query"].map((x) => x)),
        result:
            List<Ciudad>.from(json["features"].map((x) => Ciudad.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "query": List<dynamic>.from(query.map((x) => x)),
        "features": List<dynamic>.from(result.map((x) => x.toMap())),
      };
}
