import 'package:examapp/domain/model/responce/sign_up_response.dart';
import 'package:examapp/domain/model/request/user_request.dart';

abstract class SignUpDataSource {
  Future<SignUpResponse> signUpDataSource(UserRequest userRequest);
}
