import 'package:dio/dio.dart';
import 'package:model_intro/model/base_model/base_model.dart';
import 'package:model_intro/model/error_model/error_model.dart';
import 'package:model_intro/model/products/list_product_model.dart';
import 'package:model_intro/model/products/product_mode.dart';

abstract class ProducstService {
  Dio dio = Dio();
  late Response response;
  String baseUrl = 'Heelowlrd'; 

 BaseModel getProduct();
}


class ProducstServiceImp extends ProducstService {
  @override
  getProduct() async{
try {
  
   response =await dio.get(baseUrl);
   if(response.statusCode == 200){
    ListProduct products = ListProduct.fromMap(response.data);

    return products;
   }
   else {
    return ErrorModel(message: response.statusMessage.toString());
   }
  

} catch (e) {
  return ErrorModel(message: e.toString());
}

  }
}