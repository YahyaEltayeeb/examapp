import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:examapp/domain/Model/LoginRequest/LoginRequest.dart';
import 'package:injectable/injectable.dart';
import '../../../UseCase/LoginUseCase.dart';
import 'LoginStates.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    try {
      final response = await loginUseCase.invoke(request );
      response.fold(
        (failure) => emit(LoginError(failure.errorMessage)),
        (loginResponse) => emit(LoginSuccess(loginResponse)));}
    on DioException catch (e) {
      final String messageError=e.response!.data['message'];

      emit(LoginError(messageError));
    }
  }
}