import 'package:dio/dio.dart';
import 'package:examapp/api/model/request/forget_password_request.dart';
import 'package:examapp/api/model/request/reset_password_request.dart';
import 'package:examapp/api/model/request/sign_up_request.dart';
import 'package:examapp/api/model/request/verify_code_request.dart';
import 'package:examapp/api/model/response/exam_responce_by_id_dto.dart';
import 'package:examapp/api/model/response/exam_responce_dto.dart';
import 'package:examapp/api/model/response/forget_password_responce_dto.dart';
import 'package:examapp/api/model/response/question_model_dto.dart';
import 'package:examapp/api/model/response/question_responce_model_dto.dart';
import 'package:examapp/api/model/response/reset_password_responce.dart';
import 'package:examapp/api/model/response/sign_up_response_dto.dart';
import 'package:examapp/api/model/response/subject_responce_dto.dart';
import 'package:examapp/core/values/api_end_point.dart';
import 'package:examapp/data/Model/RequestLogin.dart';
import 'package:examapp/data/Model/ResponseLogin.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;
  @POST(ApiEndPoint.signUpEndPoint)
  Future<SignupResponseDto> signUp(@Body() SignUpRequestDto signUpReequest);

  @POST(ApiEndPoint.forgetPAsswordEndPoint)
  Future<ForgetPasswordResponceDto> forgetPassword(
    @Body() ForgetPasswordRequestDto forgetPasswordRequestDto,
  );

  @POST(ApiEndPoint.verifyCode)
  Future<void> verifyCode(@Body() VerifyCodeRequestDto verifyCodeRequestDto);

  @POST(ApiEndPoint.resetPassword)
  Future<ResetPasswordResponceDto> resetPassword(
    @Body() ResetPasswordRequestDto resetPasswordRequestDto,
  );

  @POST(ApiEndPoint.signInEndPoint)
  Future<ResponseLoginDTO> login(@Body() RequestLoginDTO request);

  @GET(ApiEndPoint.getAllExams)
  Future<ExamResponseDto> getAllExams();

  @GET(ApiEndPoint.getExamsById)
  Future<ExamResponseByIdDto> getExamsById(@Query('id') String id);

  @GET(ApiEndPoint.getSubject)
  Future<SubjectResponseDto> getSubject();

  @GET(ApiEndPoint.getQuetionsByExamId)
  Future<QuestionResponseModelDto> getQuestions(@Query('exam') String examId);
}
