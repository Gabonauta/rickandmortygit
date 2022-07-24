// To parse this JSON data, do
//
//     final character = characterFromMap(jsonString);

import 'dart:convert';

class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
  });

  int id;
  String name;
  String status;
  String species;
  factory Character.fromJson(String str) => Character.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Character.fromMap(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
      };
}
