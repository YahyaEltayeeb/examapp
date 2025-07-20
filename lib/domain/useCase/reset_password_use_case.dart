import 'package:examapp/domain/model/request/reset_password_request.dart';
import 'package:examapp/domain/model/responce/reset_password_responce.dart';
import 'package:examapp/domain/repos/reset_password_repo.dart';
import 'package:injectable/injectable.dart';
@injectable

class ResetPasswordUseCase {
  final ResetPasswordRepo _resetPasswordRepo;
  ResetPasswordUseCase(this._resetPasswordRepo);

  Future<ResetPasswordResponce> call(
    ResetPasswordRequest resetPasswordRequest,
  ) {
    return _resetPasswordRepo.resetPassword(resetPasswordRequest);
  }
}
