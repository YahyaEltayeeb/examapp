import 'package:examapp/api/model/request/reset_password_request.dart';
import 'package:examapp/domain/model/request/reset_password_request.dart';

ResetPasswordRequestDto convertResetPasswordRequestToDto(
  ResetPasswordRequest resetPasswordrequest,
) {
  return ResetPasswordRequestDto(
    email: resetPasswordrequest.email,
    newPassword: resetPasswordrequest.newPassword,
  );
}
