import 'package:flutter/material.dart';

class PokemonInfoModel {
  int? id;
  String? name;
  String? image;
  int? weight;
  int? height;
  String? ability;
  Map<String, dynamic>? evolveFrom;
  List<String>? types;

  PokemonInfoModel({
    this.id,
    this.name,
    this.image,
    this.weight,
    this.height,
    this.ability,
    this.evolveFrom,
    this.types,
  });

  factory PokemonInfoModel.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'] as String)
        .toList();

    var typesEvolve = [];

    if (json['types_evolve'] != null) {
      typesEvolve = (json['types_evolve'] as List)
          .map((typeJson) => typeJson['type']['name'] as String)
          .toList();
    }

    return PokemonInfoModel(
      id: json['id'],
      name: json['name'],
      image: json['sprites']['other']['official-artwork']['front_default'],
      weight: json['weight'],
      height: json['height'],
      evolveFrom: {
        'name': json['name_evolve'],
        'image': json['image_evolve'],
        'id': json['id_evolve'],
        'types': typesEvolve,
      },
      ability: json['abilities'].isNotEmpty
          ? json['abilities'][0]['ability']['name']
          : null,
      types: types,
    );
  }

  static Map<String, Color> kTypeColors = <String, Color>{
    'normal': Color(0xFFBDBEB0),
    'poison': Color(0xFF995E98),
    'psychic': Color(0xFFE96EB0),
    'grass': Color(0xFF9CD363),
    'ground': Color(0xFFE3C969),
    'ice': Color(0xFFAFF4FD),
    'fire': Color(0xFFE7614D),
    'rock': Color(0xFFCBBD7C),
    'dragon': Color(0xFF8475F7),
    'water': Color(0xFF6DACF8),
    'bug': Color(0xFFC5D24A),
    'dark': Color(0xFF886958),
    'fighting': Color(0xFF9E5A4A),
    'ghost': Color(0xFF7774CF),
    'steel': Color(0xFFC3C3D9),
    'flying': Color(0xFF81A2F8),
    'electric': Color(0xFFF9E65E),
    'fairy': Color(0xFFEEB0FA),
  };

  Color getTypeColor(String type) => kTypeColors[type] ?? Colors.black;
}
