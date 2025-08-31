import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/request/edit_profile_request.dart';
import 'package:examapp/domain/Model/responce/edit_user_model.dart';
import 'package:examapp/domain/repos/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo _editProfileRepo;
  EditProfileUseCase(this._editProfileRepo);
  Future<ApiResult<EditUserModel>> call(EditProfileRequest editProfileRequest) {
    return _editProfileRepo.editProfileRepo(editProfileRequest);
  }
}
