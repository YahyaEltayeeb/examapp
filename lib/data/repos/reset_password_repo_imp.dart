import 'package:examapp/data/data_source/reset_password_data_source.dart';
import 'package:examapp/data/mapper/reset_password_mapper_toDto.dart';
import 'package:examapp/domain/model/request/reset_password_request.dart';
import 'package:examapp/domain/model/responce/reset_password_responce.dart';
import 'package:examapp/domain/repos/reset_password_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ResetPasswordRepo)

class ResetPasswordRepoImp implements ResetPasswordRepo {
  final ResetPasswordDataSource _resetPasswordDataSource;
  ResetPasswordRepoImp(this._resetPasswordDataSource);
  @override
  Future<ResetPasswordResponce> resetPassword(
    ResetPasswordRequest resetPasswordRequest,
  ) async {
    var responce = await _resetPasswordDataSource.resetPassword(
      convertResetPasswordRequestToDto(resetPasswordRequest),
    );

    return responce.toDomain(responce);
  }
}
