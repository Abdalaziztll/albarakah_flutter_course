part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class SendLoginModel extends LoginEvent {
  UserModel user;
  SendLoginModel({
    required this.user,
  });
}
