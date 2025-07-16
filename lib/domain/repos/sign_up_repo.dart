import 'package:examapp/domain/model/user_request.dart';
import 'package:examapp/domain/model/user_response.dart';

abstract class SignUpRepo {
  Future<UserResponse> signUpRepo(UserRequest userRequest);
  
}
