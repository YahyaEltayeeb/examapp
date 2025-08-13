import 'package:examapp/api/api_module/api_result.dart';
import 'package:examapp/domain/Model/profile/userDto.dart';

import '../../Model/profile/ProfileDto.dart';

abstract class EditProfileRepo {
  Future<ApiResult<Profile>> editProfile(UserProfile userProfile);
} 