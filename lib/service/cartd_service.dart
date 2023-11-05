import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio =Dio();
  String baseUrl = 'https://dummyjson.com/carts';


  getCarts();
}

class CardService extends BaseService {
  @override
  getCarts()async {
    Response response = await dio.get(baseUrl);
    print(response);
    return response;
  }
}