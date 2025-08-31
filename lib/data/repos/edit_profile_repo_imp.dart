import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/edit_profile_data_source.dart';
import 'package:examapp/data/mapper/edit_profile_mapper_toDto.dart';
import 'package:examapp/domain/Model/request/edit_profile_request.dart';
import 'package:examapp/domain/Model/responce/edit_user_model.dart';
import 'package:examapp/domain/repos/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImp implements EditProfileRepo {
  final EditProfileDataSource _editProfileDataSource;
  EditProfileRepoImp(this._editProfileDataSource);
  @override
  Future<ApiResult<EditUserModel>> editProfileRepo(
    EditProfileRequest editProfileRequest,
  ) async {
    try {
      var responce = await _editProfileDataSource.editProfileDataSource(
        convertEditProfileRequestToDto(editProfileRequest),
      );
      var converToEditProfileModel = responce.toDomain();
      return ApiSuccessResult(converToEditProfileModel);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }

  @override
  Future<ApiResult<EditUserModel>> getUserData() async {
    try {
      var responce = await _editProfileDataSource.getUserData();
      var converToEditProfileModel = responce.toDomain();
      return ApiSuccessResult(converToEditProfileModel);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
