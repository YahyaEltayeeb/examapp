import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio();

    // إضافة interceptors
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: true,
    ));

    // إعداد timeout
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

    return dio;
  }
}
