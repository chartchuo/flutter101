import 'package:dio/dio.dart';

class Api {
  static final _singleton = Api._internal();
  factory Api() => _singleton;

  late Dio dio;
  Api._internal() {
    dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  }
}
