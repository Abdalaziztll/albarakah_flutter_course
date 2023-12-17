import 'package:dio/dio.dart';

abstract class BaseService {
  Dio dio = Dio();
  String baseurl = 'https://dummyjson.com/products';
 late Response response;
}


abstract class ProductsService extends BaseService {
  Future getAllProduct();
}


class ProductsServiceImp extends ProductsService {
  @override
  Future getAllProduct()async {
    response =await dio.get(baseurl);
    return response.data;
  }



}
