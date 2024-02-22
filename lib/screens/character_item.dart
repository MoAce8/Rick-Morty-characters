import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        width: double.infinity,
        color: Colors.black54,
        child: Text(
          character.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.blueGrey,
        ),
        child: character.image.isNotEmpty
            ? FadeInImage.assetNetwork(
                width: double.infinity,
                height: double.infinity,
                placeholder: 'assets/images/loading.gif',
                image: character.image,
                fit: BoxFit.cover,
              )
            : Image.asset('assets/images.loading.gif'),
      ),
    );
  }
}
