import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/request/change_password_request.dart';
import 'package:examapp/domain/Model/responce/change_password.dart';
import 'package:examapp/domain/repos/change_password_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ChangePasswordUseCase {
  final ChangePasswordRepo _changePasswordRepo;
  ChangePasswordUseCase(this._changePasswordRepo);
  Future<ApiResult<ChangePassword>> call(
    ChangePasswordRequest changePasswordRequest,
  ) {
    return _changePasswordRepo.changePasswordRepo(changePasswordRequest);
  }
}
