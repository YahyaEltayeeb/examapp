import 'package:examapp/domain/model/request/verify_code_request.dart';

abstract class VerifyCodeRepo {
  Future<void> verifyCode(VerifyCodeRequest verifyCodeRequest);
}
