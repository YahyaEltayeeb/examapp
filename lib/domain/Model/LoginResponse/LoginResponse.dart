import '../UserResponse/UserResponse.dart';

class LoginResponse {
  final String? message;
  final String? token;
  final User? user;
  LoginResponse({
    this.message,
    this.token,
    this.user,
  });



}