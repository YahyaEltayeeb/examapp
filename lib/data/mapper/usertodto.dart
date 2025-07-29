import 'package:examapp/data/Model/RequestLogin.dart';
import 'package:examapp/data/Model/UserDto.dart';

import '../../domain/Model/UserResponse/UserResponse.dart';

User convertUserRequestToDto(UserDTO userRequest) {
  return User(

    email: userRequest.email,

  );
}