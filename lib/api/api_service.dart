import 'package:dio/dio.dart';
import 'package:examapp/api/model/request/change_password_request_dto.dart';
import 'package:examapp/api/model/request/edit_profile_request.dart';
import 'package:examapp/api/model/request/forget_password_request.dart';
import 'package:examapp/api/model/request/reset_password_request.dart';
import 'package:examapp/api/model/request/sign_up_request.dart';
import 'package:examapp/api/model/request/verify_code_request.dart';
import 'package:examapp/api/model/response/change_password_responce_dto.dart';
import 'package:examapp/api/model/response/edit_profile_responce_dto.dart';
import 'package:examapp/api/model/response/exam_model_responce_by_sub_dto.dart';
import 'package:examapp/api/model/response/exam_responce_by_id_dto.dart';
import 'package:examapp/api/model/response/exam_responce_dto.dart';
import 'package:examapp/api/model/response/forget_password_responce_dto.dart';
import 'package:examapp/api/model/response/question_responce_model_dto.dart';
import 'package:examapp/api/model/response/reset_password_responce.dart';
import 'package:examapp/api/model/response/sign_up_response_dto.dart';
import 'package:examapp/api/model/response/subject_responce_dto.dart';
import 'package:examapp/api/model/response/verify_code_responce_dto.dart';
import 'package:examapp/core/values/api_end_point.dart';
import 'package:examapp/data/Model/RequestLogin.dart';
import 'package:examapp/data/Model/ResponseLogin.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

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
  Future<VerifyCodeResponseDto> verifyCode(
    @Body() VerifyCodeRequestDto verifyCodeRequestDto,
  );

  @PUT(ApiEndPoint.resetPassword)
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
  @GET(ApiEndPoint.getExamBySub)
  Future<ResponceModelExamBySubDto> getExamBySub(
    @Query('subject') String examSub,
  );
  @PUT(ApiEndPoint.editProfile)
  Future<EditProfileResponceDto> editProfile(
    @Body() EditProfileRequestDto editProfileRequestDto,
  );
  @GET(ApiEndPoint.getUserData)
  Future<EditProfileResponceDto> getUserData();
  @PATCH(ApiEndPoint.changePassword)
  Future<ChangePasswordResponceDto> changePassword(
    @Body() ChangePasswordRequestDto changePasswordRequestDto,
  );
}
