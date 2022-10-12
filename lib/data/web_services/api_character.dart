

import 'package:dio/dio.dart';

import '../../constants/string.dart';

class CharacterApi {
  late final Dio dio;
 CharacterApi(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds,
      receiveTimeout: 20 * 1000,
    );
dio =Dio(options);
  }

  Future<List<dynamic>> getAllCharactet() async {
    try {
      Response response = await dio.get('characters');
      //print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
}
}