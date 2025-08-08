

import 'package:examapp/domain/Model/request/forget_password_request.dart';
import 'package:examapp/domain/Model/responce/forget_password_responce.dart';



abstract class ForgetPasswordRepo {
  Future<ForgetPasswordResponce> forgetPasswordRepo(
    ForgetPasswordRequest forgetPasswordRequest,
  );
}
