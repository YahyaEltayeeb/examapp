abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordError extends ForgetPasswordState {
  String message;
  ForgetPasswordError(this.message);
}

class ForgetPasswordSuccess extends ForgetPasswordState {
  String message;
  ForgetPasswordSuccess(this.message);
}
