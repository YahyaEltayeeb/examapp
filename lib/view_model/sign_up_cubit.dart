import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:examapp/domain/model/user_request.dart';
import 'package:examapp/domain/useCase/sign_up_use_case.dart';
import 'package:examapp/view_model/sign_up_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;
  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  Future<void> signUp(UserRequest request) async {
    emit(SignUpLoadding());
    try {
      final response = await _signUpUseCase(request);
      emit(SignUpSuccess(response));
    } on DioException catch (e) {
      final String messageError=e.response!.data['message'];

      emit(SignUpError(messageError));
    }
  }
}
