import 'package:examapp/domain/Model/request/verify_code_request.dart';

abstract class VerifyCodeRepo {
  Future<void> verifyCode(VerifyCodeRequest verifyCodeRequest);
}
