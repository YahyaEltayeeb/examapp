import 'package:examapp/domain/Model/request/user_request.dart';
import 'package:examapp/domain/Model/responce/user_response.dart';


abstract class SignUpRepo {
  Future<UserResponse> signUpRepo(UserRequest userRequest);
  
}
