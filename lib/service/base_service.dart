import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseUrl = 'https://653e6cc99e8bd3be29df4853.mockapi.io/question';
}