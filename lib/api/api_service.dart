import 'package:dio/dio.dart';
import 'package:examapp/api/model/request/forget_password_request.dart';
import 'package:examapp/api/model/request/reset_password_request.dart';
import 'package:examapp/api/model/request/sign_up_request.dart';
import 'package:examapp/api/model/request/verify_code_request.dart';
import 'package:examapp/api/model/response/forget_password_responce_dto.dart';
import 'package:examapp/api/model/response/reset_password_responce.dart';
import 'package:examapp/api/model/response/sign_up_response_dto.dart';
import 'package:examapp/core/values/api_end_point.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;
  @POST(ApiEndPoint.signUpEndPoint)
  Future<SignupResponseDto> signUp(@Body() SignUpRequestDto signUpReequest);

  @factoryMethod
  @POST('auth/forgotPassword')
  Future<ForgetPasswordResponceDto> forgetPassword(
    @Body() ForgetPasswordRequestDto forgetPasswordRequestDto,
  );

  @factoryMethod
  @POST('auth/verifyResetCode')
  Future<void> verifyCode(@Body() VerifyCodeRequestDto verifyCodeRequestDto);

  @factoryMethod
  @POST("auth/resetPassword")
  Future<ResetPasswordResponceDto> resetPassword(
    @Body() ResetPasswordRequestDto resetPasswordRequestDto,
  );
}
