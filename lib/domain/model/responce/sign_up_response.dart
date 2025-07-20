import 'package:examapp/domain/model/responce/user_response.dart';

class SignUpResponse {
  final String token;
  final UserResponse user;

  SignUpResponse({required this.token, required this.user});
}
