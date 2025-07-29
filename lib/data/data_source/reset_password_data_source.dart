import 'package:examapp/api/model/request/reset_password_request.dart';
import 'package:examapp/api/model/response/reset_password_responce.dart';

abstract class ResetPasswordDataSource {
  Future<ResetPasswordResponceDto> resetPassword(
    ResetPasswordRequestDto resetPasswordRequestDto,
  );
}
