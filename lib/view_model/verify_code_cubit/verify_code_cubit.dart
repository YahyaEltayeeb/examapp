import 'package:dio/dio.dart';
import 'package:examapp/domain/Model/request/verify_code_request.dart';
import 'package:examapp/domain/useCase/verify_code_use_case.dart';
import 'package:examapp/view_model/verify_code_cubit/verify_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  // ignore: unused_field
  final VerifyCodeUseCase _verifyCodeUseCase;

  VerifyCodeCubit(this._verifyCodeUseCase) : super(VerifyCodeInitial());

  Future<void> verifyOtp(VerifyCodeRequest verifyCodeRequest) async {
    emit(VerifyCodeLoadding());
    try {
      emit(VerifyCodeSuccess());
    } on DioException catch (e) {
      final String messageError = e.response!.data['message'];

      emit(VerifyCodeError(messageError));
    }
  }
}
