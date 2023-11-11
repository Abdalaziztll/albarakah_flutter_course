import 'package:dio/dio.dart';

getData() async {
  Dio dio = Dio();

  Response response =
      await dio.get('https://jsonplaceholder.typicode.com/comments');

  return response;
}
