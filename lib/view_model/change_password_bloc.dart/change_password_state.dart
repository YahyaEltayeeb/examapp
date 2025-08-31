// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:examapp/domain/Model/responce/change_password.dart';

class ChangePasswordState {
  bool isLoadding = false;
  String errorMessage = '';
  ChangePassword? changePassword;
  ChangePasswordState({
    this.isLoadding = false,
    this.errorMessage = '',
    this.changePassword,
  });
  ChangePasswordState copyWith({
    bool? isLoadding,
    String? errorMessage,
    ChangePassword? changePassword,
  }) {
    return ChangePasswordState(
      isLoadding: isLoadding ?? this.isLoadding,
      errorMessage: errorMessage ?? this.errorMessage,
      changePassword: changePassword ?? this.changePassword,
    );
  }
}
