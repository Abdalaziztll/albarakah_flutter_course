import 'package:dio/dio.dart';

import 'usermodel.dart';

main() async {
 await logIn('Ahmad','Doctor');

  Future.delayed(Duration(seconds: 3));

 await getUser();
}

late String token;

logIn(String name, String job) async {
  Dio dio = Dio();
  UserModel user = UserModel(name: name, job: job);

  Response response =
      await dio.post('http://localhost:3000/users/add', data: user.toJson());

      if (response.statusCode == 201 ){
        print(response.data['token']);
        token = response.data['token'];
        return response.data['token'];
      }
      else {
        print("Error");
      }
}

// https://dummyjson.com/
getUser()async{

Dio dio = Dio();
Response response = await dio.get('http://localhost:3000/users/add',
options: Options(
  headers: {
    "authorization": "Bearar "+token
  }
));

if (response.statusCode == 200){
  print(response.data);
  return response.data;
}
else{
  return 'Error';
}
}