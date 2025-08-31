import 'package:examapp/api/model/request/edit_profile_request.dart';
import 'package:examapp/api/model/response/edit_user_model_dto.dart';

abstract class EditProfileDataSource {
  Future<EditUserModelDto> editProfileDataSource(
    EditProfileRequestDto editProfileRequestDto,
  );
  Future<EditUserModelDto> getUserData();
}
