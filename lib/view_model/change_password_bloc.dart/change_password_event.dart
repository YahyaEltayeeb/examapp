import 'package:examapp/domain/Model/request/change_password_request.dart';

sealed class ChangePasswordEvent {}

class SumitChangePasswordEvent extends ChangePasswordEvent {
  ChangePasswordRequest changePasswordRequest;
  SumitChangePasswordEvent(this.changePasswordRequest);
}
