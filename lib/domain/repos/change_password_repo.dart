import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/request/change_password_request.dart';
import 'package:examapp/domain/Model/responce/change_password.dart';

abstract class ChangePasswordRepo {
  Future<ApiResult<ChangePassword>> changePasswordRepo(
    ChangePasswordRequest changePasswordRequest,
  );
}
