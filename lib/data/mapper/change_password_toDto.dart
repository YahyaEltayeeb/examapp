import 'package:examapp/api/model/request/change_password_request_dto.dart';
import 'package:examapp/domain/Model/request/change_password_request.dart';

ChangePasswordRequestDto convertChangePasswordtoDto(
  ChangePasswordRequest changePasswordRequest,
) {
  return ChangePasswordRequestDto(
    oldPassword: changePasswordRequest.oldPassword,
    password: changePasswordRequest.password,
    rePassword: changePasswordRequest.rePassword,
  );
}
