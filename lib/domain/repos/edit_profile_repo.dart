import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/request/edit_profile_request.dart';
import 'package:examapp/domain/Model/responce/edit_user_model.dart';

abstract class EditProfileRepo {
  Future<ApiResult<EditUserModel>> editProfileRepo(
    EditProfileRequest editProfileRequest,
  );
  Future<ApiResult<EditUserModel>> getUserData();
}
