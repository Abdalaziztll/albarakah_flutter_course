import 'package:dio/dio.dart';

import 'comment_model.dart';
import 'user_model.dart';

main() async {
  dynamic dataResult = await logIn('kminchelle','0lelplR');
  print(dataResult);
  // List result = await getData();

  // ? Anouther Way

  // List<CommentModel> comments = List.generate(
  //     result.length, (index) => CommentModel.fromMap(result[index]));

  // print(comments[1].email);

// ? Best Practice (Nadim)
  // result.forEach((element) {
  //   comments.add(CommentModel.fromMap(element));
  // });
  // print(result);

  // ? AlAA Way
  // TODO : HomeWork for ALaa
  // comments.addAll(CommentModel.fromMap(result) );

  // for (var i = 0; i < result.length; i++) {
  //   // ? MHD way
  //   // dynamic  comment =CommentModel.fromMap(result[i]);
  //   //  comments.add(comment);
  //   // ? best practice
  //   // comments.add(CommentModel.fromMap(result[i]));
  // }

  // print(comments);
}

getData() async {
  Dio dio = Dio();

  Response response =
      await dio.get('https://jsonplaceholder.typicode.com/comments');

  if (response.statusCode == 200) {
    return response.data;
  } else {
    return 'Error';
  }
}

logIn(String username, String password) async {
  Dio dio = Dio();
  UserModel req = UserModel(username: username, password: password);
  Response response =
      await dio.post('https://dummyjson.com/auth/login', data: req.toJson());

  if (response.statusCode == 200) {
    return response.data;
  } else {
    return 'Error';
  }
}
