
import 'package:examapp/api/api_module/api_result.dart';
import 'package:examapp/domain/Model/profile/userDto.dart';
import 'package:examapp/domain/repos/profile/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';

import '../Model/profile/ProfileDto.dart';

@injectable
class EditProfileUseCase {
  final EditProfileRepo editProfileRepo;

  EditProfileUseCase(this.editProfileRepo);

  Future<ApiResult<Profile>> call(UserProfile userProfile) async {
    try {
      final response = await editProfileRepo.editProfile(userProfile);
      return response;
    } catch (e) {
      throw Exception('Failed to edit profile: $e');
    }
  }
}