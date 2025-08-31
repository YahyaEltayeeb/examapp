import 'package:examapp/domain/Model/responce/edit_user_model.dart';

class EditProfileState {
  bool isLoaddingEdit = false;
  String errorMessageEdit = '';
  EditUserModel? userModelEdit;

  // bool isLoaddingGetData = false;
  // String errorMessageGetData = '';
  // EditUserModel? userModelGetData;
  EditProfileState({
    // this.errorMessageGetData = '',
    // this.isLoaddingGetData = false,
    // this.userModelGetData,
    this.isLoaddingEdit = false,
    this.errorMessageEdit = '',
    this.userModelEdit,
  });

  EditProfileState copyWith({
    // String? errorMessageGetData = '',
    // EditUserModel? userModelGetData,
    // bool? isLoaddingGetData = false,

    String? errorMessageEdit = '',
    EditUserModel? userModelEdit,
    bool? isLoaddingEdit = false,
  }) {
    return EditProfileState(
      // userModelGetData: userModelGetData ?? this.userModelGetData,
      // errorMessageGetData: errorMessageGetData ?? this.errorMessageGetData,
      userModelEdit: userModelEdit ?? this.userModelEdit,
      isLoaddingEdit: isLoaddingEdit ?? this.isLoaddingEdit,
      errorMessageEdit: errorMessageEdit ?? this.errorMessageEdit,
     // isLoaddingGetData: isLoaddingGetData ?? this.isLoaddingGetData,
    );
  }
}
