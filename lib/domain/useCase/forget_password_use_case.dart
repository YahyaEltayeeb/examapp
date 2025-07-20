import 'package:examapp/domain/model/request/forget_password_request.dart';
import 'package:examapp/domain/model/responce/forget_password_responce.dart';
import 'package:examapp/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepo _forgetPasswordRepo;
  ForgetPasswordUseCase(this._forgetPasswordRepo);
  Future<ForgetPasswordResponce> call(
    ForgetPasswordRequest forgetPasswordRequest,
  ) {
    return _forgetPasswordRepo.forgetPasswordRepo(forgetPasswordRequest);
  }
}
