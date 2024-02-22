import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/cubit/characters_cubit.dart';
import 'package:rick_and_morty/repo/characters_repo.dart';
import 'package:rick_and_morty/screens/characters_screen.dart';
import 'package:rick_and_morty/web_serv/characters_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CharactersCubit(repo: CharactersRepo(apii: CharactersApi())),
        child: CharactersScreen(),
      ),
    );
  }
}

