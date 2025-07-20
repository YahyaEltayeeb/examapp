import 'package:examapp/domain/model/request/user_request.dart';
import 'package:examapp/domain/model/responce/user_response.dart';

abstract class SignUpRepo {
  Future<UserResponse> signUpRepo(UserRequest userRequest);
  
}
