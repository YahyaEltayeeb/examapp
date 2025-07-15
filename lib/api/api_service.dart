import 'package:dio/dio.dart';
import 'package:examapp/api/model/request/sign_up_request.dart';
import 'package:examapp/api/model/response/sign_up_response.dart';
import 'package:examapp/core/values/api_end_point.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio,) = _ApiServices;
  @POST(ApiEndPoint.signUpEndPoint)
  Future<SignupResponseDto> signUp(@Body() SignUpRequestDto signUpReequest);
}
