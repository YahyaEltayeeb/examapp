

import '../model/request/reset_password_request.dart';
import '../model/responce/reset_password_responce.dart';

abstract class ResetPasswordRepo {
  Future<ResetPasswordResponce> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );
}
