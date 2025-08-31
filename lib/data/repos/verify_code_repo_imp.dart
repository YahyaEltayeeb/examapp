import 'package:examapp/data/data_source/verify_code_data_source.dart';
import 'package:examapp/data/mapper/verify_code_mapper_toDto.dart';
import 'package:examapp/domain/Model/request/verify_code_request.dart';
import 'package:examapp/domain/Model/responce/verify_code_model.dart';
import 'package:examapp/domain/repos/verify_code_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyCodeRepo)
class VerifyCodeRepoImp implements VerifyCodeRepo {
  final VerifyCodeDataSource _verifyCodeDataSource;
  VerifyCodeRepoImp(this._verifyCodeDataSource);
  @override
  Future<VerifyCodeModel> verifyCode(
    VerifyCodeRequest verifyCodeRequest,
  ) async {
    var responce = await _verifyCodeDataSource.verifyCode(
      convertVerifyCodeToDto(verifyCodeRequest),
    );

    return responce.toDomain();
  }
}
