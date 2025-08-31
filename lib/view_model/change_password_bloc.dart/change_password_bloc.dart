import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/core/di/di.dart';
import 'package:examapp/data/data_source/token_local_data_source.dart';
import 'package:examapp/domain/Model/responce/change_password.dart';
import 'package:examapp/domain/useCase/change_password_use_case.dart';
import 'package:examapp/view_model/change_password_bloc.dart/change_password_event.dart';
import 'package:examapp/view_model/change_password_bloc.dart/change_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordUseCase _changePasswordUseCase;
  ChangePasswordBloc(this._changePasswordUseCase)
    : super(ChangePasswordState()) {
    on<SumitChangePasswordEvent>(_changePassword);
  }
  void _changePassword(SumitChangePasswordEvent event, Emitter emit) async {
    emit(state.copyWith(isLoadding: true));
    ApiResult<ChangePassword> result = await _changePasswordUseCase.call(
      event.changePasswordRequest,
    );

    switch (result) {
      case ApiSuccessResult():
        if (result.data.token.isNotEmpty) {
          _changeToken(result.data.token);
        }
        return emit(
          state.copyWith(isLoadding: false, changePassword: result.data),
        );

      case ApiErrorResult():
        return emit(
          state.copyWith(isLoadding: false, errorMessage: result.errorNessage),
        );
    }
  }

  void _changeToken(String newToken) {
    getIt<TokenLocalDataSource>().deleteToken();
    getIt<TokenLocalDataSource>().saveToken(newToken);
  }
}
