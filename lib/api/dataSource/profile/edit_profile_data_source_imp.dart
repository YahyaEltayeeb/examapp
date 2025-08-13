// // import 'package:examapp/api/api_service.dart';
// // import 'package:examapp/data/Model/profile/userDto.dart';
// // import 'package:examapp/domain/Model/profile/ProfileDto.dart';
// // import 'package:examapp/domain/Model/profile/userDto.dart';
// // import 'package:injectable/injectable.dart';
// // import '../../../data/data_source/profile/edit_profile_data_source.dart';
// //
// // @Injectable(as: EditProfileDataSource)
// // class EditProfileDataSourceImpl implements EditProfileDataSource {
// //   final ApiServices apiServices;
// //
// //   EditProfileDataSourceImpl(this.apiServices);
// //
// //   @override
// //   Future<Profile> editProfile(UserProfileDto userProfile) async {
// //     try {
// //       final responseDto = await apiServices.editProfile(userProfile);
// //       final editProfileResponse = responseDto.toProfile();
// //       return editProfileResponse;
// //     } catch (e) {
// //       throw Exception('Failed to edit profile: $e');
// //     }
// //   }
// // }
// import 'package:examapp/api/api_service.dart';
// import 'package:examapp/data/Model/profile/userDto.dart';
// import 'package:examapp/domain/Model/profile/ProfileDto.dart';
// import 'package:examapp/domain/Model/profile/userDto.dart';
// import 'package:injectable/injectable.dart';
// import '../../../data/data_source/profile/edit_profile_data_source.dart';
//
// @Injectable(as: EditProfileDataSource)
// class EditProfileDataSourceImpl implements EditProfileDataSource {
//   final ApiServices apiServices;
//
//   EditProfileDataSourceImpl(this.apiServices);
//
//   @override
//   Future<Profile> editProfile(UserProfile userProfile) async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString("token");
//       final userProfileDto = UserProfileDto.fromDomain( userProfile );
//       final responseDto = await apiServices.editProfile(userProfileDto,);
//       final editProfileResponse = responseDto.toProfile();
//       return editProfileResponse;
//     } catch (e) {
//       throw Exception('Failed to edit profile: $e');
//     }
//   }
// }
import 'package:examapp/api/api_module/api_result.dart';
import 'package:examapp/api/api_service.dart';
import 'package:examapp/data/Model/profile/userDto.dart';
import 'package:examapp/domain/Model/profile/ProfileDto.dart';
import 'package:examapp/domain/Model/profile/userDto.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/data_source/profile/edit_profile_data_source.dart';

@Injectable(as: EditProfileDataSource)
class EditProfileDataSourceImpl implements EditProfileDataSource {
  final ApiServices apiServices;
  final SharedPreferences prefs; // جايه من SharedPrefModule

  EditProfileDataSourceImpl(this.apiServices, this.prefs);

  @override
  Future<ApiResult<Profile>> editProfile(UserProfile userProfile) async {
    try {
      final token = prefs.getString("token");

      if (token == null || token.isEmpty) {
        throw Exception('Token not found, please login first.');
      }

      final userProfileDto = UserProfileDto.fromDomain(userProfile);

      final responseDto = await apiServices.editProfile(
        userProfileDto,
        token,
      );

      return ApiSuccessResult(data: responseDto.toProfile());
    } catch (e) {

     return ApiErrorResult(errorMessage: e.toString());
    }
  }
}
