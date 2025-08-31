abstract class VerifyCodeState {
  const VerifyCodeState();
}

class VerifyCodeInitial extends VerifyCodeState {
  const VerifyCodeInitial();
}

class VerifyCodeLoading extends VerifyCodeState {
  const VerifyCodeLoading();
}

class VerifyCodeSuccess extends VerifyCodeState {
  const VerifyCodeSuccess();
}

class VerifyCodeError extends VerifyCodeState {
  final String messageError;
  const VerifyCodeError(this.messageError);
}
