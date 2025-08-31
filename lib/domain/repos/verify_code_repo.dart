import 'package:examapp/domain/Model/request/verify_code_request.dart';
import 'package:examapp/domain/Model/responce/verify_code_model.dart';

abstract class VerifyCodeRepo {
  Future<VerifyCodeModel> verifyCode(VerifyCodeRequest verifyCodeRequest);
}
