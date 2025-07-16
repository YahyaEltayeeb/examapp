import 'package:examapp/domain/model/sign_up_response.dart';
import 'package:examapp/domain/model/user_request.dart';

abstract class SignUpDataSource {
  Future<SignUpResponse> signUpDataSource(UserRequest userRequest);
}
