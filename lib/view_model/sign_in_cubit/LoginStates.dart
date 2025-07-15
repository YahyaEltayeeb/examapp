import 'package:examapp/domain/Model/LoginResponse/LoginResponse.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse user;
  LoginSuccess(this.user);
}

class LoginError extends LoginState {
  String message;
  LoginError(this.message);
}