import 'package:examapp/api/model/request/verify_code_request.dart';

abstract class VerifyCodeDataSource {
  Future<void> verifyCode(VerifyCodeRequestDto verifyCodeRequestDto);
}
