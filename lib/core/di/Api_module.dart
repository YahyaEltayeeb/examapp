import 'package:dio/dio.dart';
import 'package:examapp/api/interceptor/auth_interceptor.dart';
import 'package:examapp/core/values/api_end_point.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ApiModule {
  @singleton
  Dio dioProvider() {
    var dio = Dio(BaseOptions(baseUrl: ApiEndPoint.baseUrl));

    dio.interceptors.add(
      PrettyDioLogger(error: true,
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
     // dio.interceptors.add(interceptor);
    return dio;
  }
  
}
