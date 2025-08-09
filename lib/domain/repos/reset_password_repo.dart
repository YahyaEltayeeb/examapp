

import 'package:examapp/domain/Model/request/reset_password_request.dart';
import 'package:examapp/domain/Model/responce/reset_password_responce.dart';


abstract class ResetPasswordRepo {
  Future<ResetPasswordResponce> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  );
}
