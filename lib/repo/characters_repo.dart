import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/web_serv/characters_api.dart';

class CharactersRepo{
  final CharactersApi apii;

  CharactersRepo({required this.apii});

  Future<List> getAllCharacters()async {
    final characters = await apii.getAllCharacters();
    List allCharacters = [];
    print('+++++++++++++++++++++++++++++++++++++++++++++++');
    print(characters);
    for(int i=0;i<characters.length;i++){
      Character char = Character.fromJson(characters[i]);
      allCharacters.add(char);
    }
    return allCharacters;
  }
}