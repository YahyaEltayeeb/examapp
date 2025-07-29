import 'package:examapp/domain/model/request/verify_code_request.dart';
import 'package:examapp/domain/repos/verify_code_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseCase {
  final VerifyCodeRepo _verifyCodeRepo;
  VerifyCodeUseCase(this._verifyCodeRepo);
  Future<void> call(VerifyCodeRequest verifyCodeRequest) async {
    return _verifyCodeRepo.verifyCode(verifyCodeRequest);
  }
}
