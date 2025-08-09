// import 'package:dio/dio.dart';
// import 'package:examapp/core/values/api_end_point.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// @module
// abstract class ApiModule {
//   @singleton
//   Dio dioProvider(SharedPreferences prefs) {
//     var dio = Dio(BaseOptions(baseUrl: ApiEndPoint.baseUrl));
//
//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           final token = prefs.getString('token');
//           print('Retrieved token: $token');
//           if (token != null && token.isNotEmpty) {
//             options.headers['Authorization'] = 'Bearer $token';
//             print('Authorization header set');
//           } else {
//             print('No token found or token is empty');
//           }
//           return handler.next(options);
//         },
//       ),
//     );
//
//     dio.interceptors.add(
//       PrettyDioLogger(
//         error: true,
//         request: true,
//         requestBody: true,
//         responseBody: true,
//         requestHeader: true,
//         responseHeader: true,
//       ),
//     );
//     return dio;
//   }
// }
import 'package:dio/dio.dart';
import 'package:examapp/core/values/api_end_point.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class ApiModule {
  @singleton
  Dio dioProvider(SharedPreferences prefs) {
    var dio = Dio(BaseOptions(baseUrl: ApiEndPoint.baseUrl));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = prefs.getString('token');
          print('Retrieved token: $token');
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
            print('Authorization header set');
          } else {
            print('No token found or token is empty');
          }
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        error: true,
        request: true,
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    return dio;
  }
}