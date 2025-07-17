import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class ApiModule{

  @singleton
  PrettyDioLogger prettyDioLogger(){
    return PrettyDioLogger();
  }

  @singleton
  Dio provideDio(PrettyDioLogger logger){
    var dio = Dio(
      BaseOptions(
        baseUrl: "https://exam.elevateegy.com/api/v1/",
        receiveDataWhenStatusError: false,
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
      )
    );
    dio.interceptors.add(logger);
    return dio;
  }
  // @singleton
  // ApiService ProvideApiService(Dio dio)=>ApiService(dio);
}