import 'package:dio/dio.dart';
import 'package:examapp/domain/model/request/reset_password_request.dart';
import 'package:examapp/domain/useCase/reset_password_use_case.dart';
import 'package:examapp/view_model/reset_password_cubit/reset_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordUseCase _resetPasswordUseCase;
  ResetPasswordCubit(this._resetPasswordUseCase)
    : super(ResetPasswordInitial());
  Future<void> resetPassword(ResetPasswordRequest resetPasswordRequest) async {
    emit(ResetPasswordLoadding());
    try {
   var responce=await _resetPasswordUseCase.call(resetPasswordRequest);
      emit(ResetPasswordSuccess(responce.token));
    } on DioException catch (e) {
      final String messageError = e.response!.data['message'];

      emit(ResetPasswordError(messageError));
    }
  }
}
