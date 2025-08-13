
import 'package:examapp/api/api_module/api_result.dart';

import '../../../domain/Model/profile/ProfileDto.dart';
import '../../../domain/Model/profile/userDto.dart';

abstract class EditProfileDataSource {
  Future<ApiResult<Profile>> editProfile(UserProfile userProfile);
} 