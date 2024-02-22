import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/models/info_model.dart';

class AllCharacters {
  AllCharacters({
    required this.info,
    required this.results,
  });
  late final Info info;
  late final List<Character> results;

  AllCharacters.fromJson(Map<String, dynamic> json){
    info = Info.fromJson(json['info']);
    results = List.from(json['results']).map((e)=>Character.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['info'] = info.toJson();
    data['results'] = results.map((e)=>e.toJson()).toList();
    return data;
  }
}