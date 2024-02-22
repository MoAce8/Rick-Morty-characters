import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/cubit/characters_cubit.dart';
import 'package:rick_and_morty/screens/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  // List allCharacters = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CharactersCubit.get(context).getAllCharacters();
    // allCharacters =
    //     BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    print('*********************************************');
    // print(CharactersCubit.get(context).getAllCharacters());
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {

        if (state is CharactersLoaded) {
          print(state.characters);
          return Scaffold(
            backgroundColor: Colors.blueGrey,
              appBar: AppBar(
                title: const Text('All Characters'),
                centerTitle: true,
              ),
              body: GridView.builder(
                itemCount: state.characters.length,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                ),
                itemBuilder: (context, index) => CharacterItem(
                  character: state.characters[index],
                ),
              ));
        } else {
          print('moeeeeeeeeeeeeeeeeeeeeeeeeeeeee');

          return Scaffold(
            appBar: AppBar(
              title: const Text('All Characters'),
              centerTitle: true,
            ),
            body: Container(
              height: 300,
              width: 300,
              color: Colors.pinkAccent,
            ),
          );
        }
      },
    );
  }
}


