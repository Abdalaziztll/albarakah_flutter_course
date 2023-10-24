import 'package:bloc/bloc.dart';
import 'package:bloc_session/view/model/usermodel.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<SendLoginModel>((event, emit) async {
    emit(Loading());
    var response =await login(event.user);

    if(response){
      emit(Success(token: 'token'));
    }
    else {
      emit(Error());
    }

    });
  }
}

// ! I swear this is a Service Layer

login(UserModel user)async{
  Dio dio =Dio();

await Future.delayed(Duration(seconds: 4));

  if (user.name == 'Ahmad'){
    return true;
  }
  else {
    return false;
  }
}
