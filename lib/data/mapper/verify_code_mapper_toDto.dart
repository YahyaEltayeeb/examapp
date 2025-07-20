import 'package:examapp/api/model/request/verify_code_request.dart';
import 'package:examapp/domain/model/request/verify_code_request.dart';

VerifyCodeRequestDto convertVerifyCodeToDto(VerifyCodeRequest verifyCodeRequest){
return VerifyCodeRequestDto(resetCode: verifyCodeRequest.verifyCode);
}