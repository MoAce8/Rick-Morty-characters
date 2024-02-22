part of 'characters_cubit.dart';


abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState{
  final List characters;

  CharactersLoaded({required this.characters});
}

class CharactersLoading extends CharactersState {}

class CharactersError extends CharactersState {}