// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import '../../../domain/Model/profile/userDto.dart';
// import '../../../domain/useCase/edit_profile_use_case.dart';
// import 'edit_profile_state.dart';
//
// @injectable
// class EditProfileCubit extends Cubit<EditProfileState> {
//   final EditProfileUseCase editProfileUseCase;
//
//   EditProfileCubit(this.editProfileUseCase) : super(EditProfileInitial());
//
//   Future<void> editProfile({
//     required String username,
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String phone,
//     required String password,
//   }) async {
//     emit(EditProfileLoading());
//     try {
//       final userProfile = UserProfile(
//         username: username,
//         firstName: firstName,
//         lastName: lastName,
//         email: email,
//         phone: phone,
//         password: password,
//       );
//
//       final result = await editProfileUseCase(userProfile);
//       emit(EditProfileSuccess(result.));
//     } catch (e) {
//       emit(EditProfileError(e.toString()));
//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:examapp/domain/Model/profile/ProfileDto.dart';
import 'package:examapp/domain/useCase/edit_profile_use_case.dart';
import 'package:examapp/view_model/edit_profile_cubit/edit_profile_state.dart';
import 'package:injectable/injectable.dart';
import '../../api/api_module/api_result.dart';
import '../../domain/Model/profile/userDto.dart';

@injectable
class EditProfileCubit extends Cubit<EditProfileState>{
  EditProfileUseCase editProfileUseCase;
  EditProfileCubit({required this.editProfileUseCase})
      :super (EditProfileState());

  Future<void> editProfile({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(state.copyWith(isLoadingProfile: true));

    final result = await editProfileUseCase.call(
        UserProfile(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
        password: password,
      ));

    if (result is ApiSuccessResult<Profile>) {
      print('✅ profile Loaded: ${result.data}');

      emit(state.copyWith(
        isLoadingProfile: false,
          profile: result.data != null ? [result.data] : []
      ));
    } else if (result is ApiErrorResult) {
      print('❌ Error: ${state.errorProfile}');

      emit(state.copyWith(
        isLoadingProfile: false,
        errorProfile: state.errorProfile ,
      ));
    }
  }

















}