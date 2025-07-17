import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../data/Model/RequestLogin.dart';
import '../../data/Model/ResponseLogin.dart';
part 'ApiService.g.dart';

@RestApi()
@injectable
@singleton
abstract class ApiService {
  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @POST("auth/signin")
  Future<ResponseLoginDTO> login(@Body() RequestLoginDTO request);
}