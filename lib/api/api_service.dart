
import 'package:dio/dio.dart';
import 'package:examapp/api/model/response/exam_responce_by_id_dto.dart';
import 'package:examapp/api/model/response/subject_responce_dto.dart';
import 'package:examapp/core/values/api_end_point.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';

@RestApi()
@injectable
abstract class ApiServices {
  @factoryMethod
  factory ApiServices(Dio dio) = _ApiServices;

  @GET(ApiEndPoint.getExamsById)
  Future<ExamResponseByIdDto> getExamsById(@Query('id') String id);

  @GET(ApiEndPoint.getSubject)
  Future<SubjectResponseDto> getSubject();
}
