import 'package:examapp/api/model/request/verify_code_request.dart';
import 'package:examapp/api/model/response/verify_code_responce_dto.dart';

abstract class VerifyCodeDataSource {
  Future<VerifyCodeResponseDto> verifyCode(VerifyCodeRequestDto verifyCodeRequestDto);
}
