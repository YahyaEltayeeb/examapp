// import 'package:examapp/api/api_service.dart';
// import 'package:examapp/data/Model/profile/userDto.dart';
// import 'package:examapp/domain/Model/profile/ProfileDto.dart';
// import 'package:examapp/domain/Model/profile/userDto.dart';
// import 'package:injectable/injectable.dart';
//
// import 'edit_profile_data_source.dart';
//
// @Injectable(as: EditProfileDataSource)
// class EditProfileDataSourceImpl implements EditProfileDataSource {
//   final ApiService apiService;
//
//   EditProfileDataSourceImpl(this.apiService);
//
//   @override
//   Future<Profile> editProfile(UserProfile userProfile) async {
//     try {
//       final userProfileDto = UserProfileDto.fromDomain(userProfile);
//       final response = await apiService.editProfile(userProfileDto);
//
//       return Profile(
//         message: response.message,
//         user: response.user?.toDomain(),
//       );
//     } catch (e) {
//       throw Exception('Failed to edit profile: $e');
//     }
//   }
// }
