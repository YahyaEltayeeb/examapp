import 'package:dio/dio.dart';
import 'package:examapp/domain/model/request/forget_password_request.dart';
import 'package:examapp/domain/useCase/forget_password_use_case.dart';
import 'package:examapp/view_model/forget_password_cubit/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  ForgetPasswordCubit(this._forgetPasswordUseCase)
    : super(ForgetPasswordInitial());

  Future<void> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    emit(ForgetPasswordLoadding());
    try {
      var responce = await _forgetPasswordUseCase.call(forgetPasswordRequest);
      emit(ForgetPasswordSuccess(responce.message));
    }on DioException catch (e) {
      final String messageError=e.response!.data['message'];
      emit(ForgetPasswordError(messageError));
    }
  }
}
