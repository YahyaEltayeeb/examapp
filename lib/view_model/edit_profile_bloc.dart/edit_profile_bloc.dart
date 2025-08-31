import 'package:bloc/bloc.dart';
import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/responce/edit_user_model.dart';
import 'package:examapp/domain/useCase/edit_profile_use_case.dart';
import 'package:examapp/domain/useCase/get_user_data_use_case.dart';
import 'package:examapp/view_model/edit_profile_bloc.dart/edit_profile_event.dart';
import 'package:examapp/view_model/edit_profile_bloc.dart/edit_profile_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileBloc extends Bloc<ProfileEvent, EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  final GetUserDataUseCase _getUserDataUseCase;
  EditProfileBloc(this._editProfileUseCase, this._getUserDataUseCase)
    : super(EditProfileState()) {
    on<EditProfileEvent>(_editProfile);
    on<GetUserDataEvent>(_getProfileData);
  }
  Future<void> _editProfile(EditProfileEvent event, Emitter emit) async {
    emit(state.copyWith(isLoaddingEdit: true));
    var result = await _editProfileUseCase.call(event.editProfileRequest);
    switch (result) {
      case ApiSuccessResult<EditUserModel>():
        return emit(
          state.copyWith(isLoaddingEdit: false, userModelEdit: result.data),
        );

      case ApiErrorResult<EditUserModel>():
        return emit(
          state.copyWith(
            isLoaddingEdit: false,
            errorMessageEdit: result.errorNessage,
          ),
        );
    }
  }

  Future<void> _getProfileData(GetUserDataEvent event, Emitter emit) async {
    emit(state.copyWith(isLoaddingEdit: true));
    var result = await _getUserDataUseCase.call();
    switch (result) {
      case ApiSuccessResult():
        return emit(
          state.copyWith(
            isLoaddingEdit: false,
            userModelEdit: result.data,
          ),
        );
      case ApiErrorResult():
        return emit(
          state.copyWith(
            isLoaddingEdit: false,
            errorMessageEdit: result.errorNessage,
          ),
        );
    }
  }
}
