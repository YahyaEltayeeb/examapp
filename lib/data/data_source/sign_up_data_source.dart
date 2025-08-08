import 'package:examapp/domain/Model/request/user_request.dart';
import 'package:examapp/domain/Model/responce/sign_up_response.dart';


abstract class SignUpDataSource {
  Future<SignUpResponse> signUpDataSource(UserRequest userRequest);
}
