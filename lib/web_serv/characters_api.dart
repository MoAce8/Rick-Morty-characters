import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/shared/constants.dart';

class CharactersApi {
  late Dio dio;

  CharactersApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      log(response.data.toString());
      print('-------------------------------------');
      print(response.data['results']);
      return response.data['results'];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
