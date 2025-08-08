import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/responce/question_model.dart';
import 'package:examapp/domain/useCase/get_question_use_case.dart';
import 'package:examapp/view_model/question_cubit/question_event.dart';
import 'package:examapp/view_model/question_cubit/question_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionBloc extends Bloc<GetQuestionEvevnt, GetQuestionState> {
  final GetQuestionUseCase _getQuestionUseCase;

  GetQuestionBloc(this._getQuestionUseCase) : super(GetQuestionState()) {
    on<GetQuestionEvevnt>(_getQuestions);
  }

  void _getQuestions(GetQuestionEvevnt event, Emitter emit) async {
    emit(state.copyWith(isLoadding: true));
    ApiResult<List<QuestionModel>> resultResponce = await _getQuestionUseCase
        .call(event.examId);
    switch (resultResponce) {
      case ApiSuccessResult<List<QuestionModel>>():
        emit(state.copyWith(isLoadding: false, question: resultResponce.data));
        break;
      case ApiErrorResult<List<QuestionModel>>():
        emit(
          state.copyWith(
            isLoadding: false,
            errorMessage: resultResponce.errorNessage,
          ),
        );
        break;
    }
  }
}
