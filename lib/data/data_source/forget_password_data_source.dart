import 'package:examapp/domain/model/request/forget_password_request.dart';
import 'package:examapp/domain/model/responce/forget_password_responce.dart';

abstract class ForgetPasswordDataSource {
  Future<ForgetPasswordResponce> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  );
}
