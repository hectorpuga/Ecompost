import 'dart:convert';

class Ciudad {
  Ciudad({
    required this.id,
    required this.type,
    required this.placeType,
    required this.relevance,
    required this.name,
    required this.placeName,
    required this.coordenadas,
  });

  String id;
  String type;
  List<String> placeType;
  double relevance;
  String name;
  String placeName;
  List<double> coordenadas;

  factory Ciudad.fromJson(String str) => Ciudad.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ciudad.fromMap(Map<String, dynamic> json) => Ciudad(
        id: json["id"],
        type: json["type"],
        placeType: json["place_type"] == null
            ? []
            : List<String>.from(json["place_type"].map((x) => x)),
        relevance: json["relevance"],
        name: json["text"],
        placeName: json["place_name"],
        coordenadas: List<double>.from(json["center"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "place_type": List<dynamic>.from(placeType.map((x) => x)),
        "relevance": relevance,
        "text": name,
        "place_name": placeName,
        "center": List<dynamic>.from(coordenadas.map((x) => x)),
      };
}
