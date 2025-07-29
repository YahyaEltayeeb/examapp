abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoadding extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  String newToken;
  ResetPasswordSuccess(this.newToken);
}

class ResetPasswordError extends ResetPasswordState {
  String messageError;
  ResetPasswordError(this.messageError);
}
