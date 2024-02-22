import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/repo/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.repo}) : super(CharactersInitial());
  final CharactersRepo repo;

  // late List characters;

  static CharactersCubit get(context) => BlocProvider.of(context);

  getAllCharacters() async {
    try {
      List characters = await repo.getAllCharacters();
      emit(CharactersLoading());
      print('///////////////////////////////////////////');
      print(characters);
      Future.delayed(
        const Duration(milliseconds: 1200),
        () {
          emit(CharactersLoaded(characters: characters));
        },
      );

    } on Exception catch (e) {
      emit(CharactersError());

    }

    // this.characters = characters ;

    // return characters;
  }
}
