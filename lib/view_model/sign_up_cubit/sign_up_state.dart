import 'package:examapp/domain/model/responce/user_response.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoadding extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final UserResponse user;
  SignUpSuccess(this.user);
}

class SignUpError extends SignUpState {
  String message;
  SignUpError(this.message);
}
