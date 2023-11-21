//
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CommentContoller extends GetxController {
  var counter = 0.obs;
  var isLoading = false.obs;
  dynamic data;
  increamnt() => counter++;

  getData() async {
    Dio dio = Dio();

    dynamic response =
        await dio.get('https://jsonplaceholder.typicode.com/comments/1');
    print(response);
    if (response.statusCode == 200) {
      isLoading = true.obs;

      data = response.data;
    }
    return response.data;
  }
}
