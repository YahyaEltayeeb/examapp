import 'package:examapp/domain/Model/request/verify_code_request.dart';
import 'package:examapp/domain/Model/responce/verify_code_model.dart';
import 'package:examapp/domain/repos/verify_code_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeUseCase {
  final VerifyCodeRepo _verifyCodeRepo;
  VerifyCodeUseCase(this._verifyCodeRepo);
  Future<VerifyCodeModel> call(VerifyCodeRequest verifyCodeRequest) async {
    return _verifyCodeRepo.verifyCode(verifyCodeRequest);
  }
}
