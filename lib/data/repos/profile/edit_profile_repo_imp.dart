import 'package:examapp/api/api_module/api_result.dart';
import 'package:examapp/domain/repos/profile/edit_profile_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/Model/profile/ProfileDto.dart';
import '../../../domain/Model/profile/userDto.dart';
import '../../data_source/profile/edit_profile_data_source.dart';

@Injectable(as: EditProfileRepo)
class EditProfileRepoImpl implements EditProfileRepo {
  final EditProfileDataSource editProfileDataSource;

  EditProfileRepoImpl(this.editProfileDataSource);

  @override
  Future <ApiResult<Profile>> editProfile(UserProfile userProfile) async {
    //   try {
    //     final response = await editProfileDataSource.editProfile(userProfile);
    //     return ApiSuccessResult<Profile>(data: response);
    //   } catch (e) {
    //     return ApiErrorResult<Profile>(
    //         errorMessage: e.toString(),
    //       );
    //   }
    // }
    final apiResult = await editProfileDataSource.editProfile(userProfile);

    if (apiResult is ApiSuccessResult<Profile>) {
      return ApiSuccessResult<Profile>(data: apiResult.data);
    } else if (apiResult is ApiErrorResult<Profile>) {
      return ApiErrorResult<Profile>(
        errorMessage: apiResult.errorMessage,
      );
    }
    return ApiErrorResult<Profile>(
      errorMessage: "Unknown error occurred",
    );
  }

}
