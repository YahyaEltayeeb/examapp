import 'package:examapp/api/model/request/edit_profile_request.dart';
import 'package:examapp/domain/Model/request/edit_profile_request.dart';

EditProfileRequestDto convertEditProfileRequestToDto(
  EditProfileRequest? editProfileRequest,
) {
  return EditProfileRequestDto(
    username: editProfileRequest!.username,
    firstName: editProfileRequest.firstName,
    lastName: editProfileRequest.lastName,
    email: editProfileRequest.email,
    phone: editProfileRequest.phone,
   
  );
}
