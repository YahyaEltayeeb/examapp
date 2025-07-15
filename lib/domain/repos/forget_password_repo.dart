

import '../model/request/forget_password_request.dart';
import '../model/responce/forget_password_responce.dart';

abstract class ForgetPasswordRepo {
  Future<ForgetPasswordResponce> forgetPasswordRepo(
    ForgetPasswordRequest forgetPasswordRequest,
  );
}
