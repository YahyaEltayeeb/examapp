import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/request/edit_profile_request.dart';
import 'package:examapp/api/model/response/edit_user_model_dto.dart';
import 'package:examapp/data/data_source/edit_profile_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: EditProfileDataSource)
class EditProfileDataSourceImp implements EditProfileDataSource {
  final ApiServices _apiServices;
  EditProfileDataSourceImp(this._apiServices);

  @override
  Future<EditUserModelDto> editProfileDataSource(
    EditProfileRequestDto editProfileRequestDto,
  ) async {
    var response = await _apiServices.editProfile(editProfileRequestDto);
    return response.user;
  }

  @override
  Future<EditUserModelDto> getUserData() async {
    var responce = await _apiServices.getUserData();
    return responce.user;
  }
}
