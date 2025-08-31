import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/responce/edit_user_model.dart';
import 'package:examapp/domain/repos/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserDataUseCase {
  final EditProfileRepo _editProfileRepo;
  GetUserDataUseCase(this._editProfileRepo);
  Future<ApiResult<EditUserModel>> call() {
    return _editProfileRepo.getUserData();
  }
}
