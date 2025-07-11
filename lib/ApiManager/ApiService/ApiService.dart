
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../data/Model/LoginModel.dart';
import 'Model/LoginRequest/LoginRequest.dart';

part 'ApiService.g.dart';

@RestApi(baseUrl: "https://api.example.com/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("auth/signing")
  Future<LoginModel> login(@Body() LoginRequest request);
}