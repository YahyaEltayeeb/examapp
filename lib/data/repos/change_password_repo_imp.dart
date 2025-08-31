import 'package:dio/dio.dart';
import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/change_password_data_source.dart';
import 'package:examapp/data/data_source/token_local_data_source.dart';
import 'package:examapp/data/mapper/change_password_toDto.dart';
import 'package:examapp/domain/Model/request/change_password_request.dart';
import 'package:examapp/domain/Model/responce/change_password.dart';
import 'package:examapp/domain/repos/change_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ChangePasswordRepo)
class ChangePasswordRepoImp implements ChangePasswordRepo {
  final ChangePasswordDataSource _changePasswordDataSource;
  ChangePasswordRepoImp(this._changePasswordDataSource);
  @override
  Future<ApiResult<ChangePassword>> changePasswordRepo(
    ChangePasswordRequest changePasswordRequest,
  ) async {
    try {
      var responceDto = await _changePasswordDataSource.changePasswordDs(
        convertChangePasswordtoDto(changePasswordRequest),
      );
      var responce = responceDto.toDomain(responceDto);
      return ApiSuccessResult(responce);
    } on DioException catch (e) {
      return ApiErrorResult(e.message.toString());
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
