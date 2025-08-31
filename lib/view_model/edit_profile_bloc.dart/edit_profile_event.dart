import 'package:examapp/domain/Model/request/edit_profile_request.dart';

abstract class ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  EditProfileRequest editProfileRequest;
  EditProfileEvent(this.editProfileRequest);
}

class GetUserDataEvent extends ProfileEvent {}
