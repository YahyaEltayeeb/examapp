abstract class VerifyCodeState {}

class VerifyCodeInitial extends VerifyCodeState {}

class VerifyCodeError extends VerifyCodeState {
  String messageError;
  VerifyCodeError(this.messageError);
}

class VerifyCodeSuccess extends VerifyCodeState {}

class VerifyCodeLoadding extends VerifyCodeState {}
