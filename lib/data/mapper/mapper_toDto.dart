import 'package:examapp/api/model/request/sign_up_request.dart';
import 'package:examapp/domain/model/user_request.dart';

SignUpRequestDto convertUserRequestToDto(UserRequest userRequest) {
  return SignUpRequestDto(
    username: userRequest.username,
    rePassword: userRequest.rePassword,
    firstName: userRequest.firstName,
    lastName: userRequest.lastName,
    email: userRequest.email,
    password: userRequest.password,
    phone: userRequest.phone,
  );
}
