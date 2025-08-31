import 'package:dio/dio.dart';
import 'package:examapp/data/data_source/token_local_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  final TokenLocalDataSource _tokenLocal;
  AuthInterceptor(this._tokenLocal);
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path.contains('auth/signup') ||
        options.path.contains('auth/signin') ||
        options.path.contains('auth/resetPassword') ||
        options.path.contains('auth/forgotPassword') ||
        options.path.contains('auth/verifyResetCode')) {
      return handler.next(options);
    }
    final token = await _tokenLocal.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
    }
    return handler.next(options);
  }
}
