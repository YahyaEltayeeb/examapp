import 'package:bloc/bloc.dart';
import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/exam_model_by_id.dart';
import 'package:examapp/domain/useCase/get_exams_by_id_use_case.dart';
import 'package:examapp/view_model/exams_by_id_cubit/exam_by_id_event.dart';
import 'package:examapp/view_model/exams_by_id_cubit/exam_by_id_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class ExamByIdBloc
    extends Bloc<GetExamsByIdEvent, GetExamByIdState> {
  final GetExamsByIdUseCase _getExamsBySubjectUseCase;

  ExamByIdBloc(this._getExamsBySubjectUseCase)
    : super(GetExamByIdState()) {
    on<GetExamsByIdEvent>(_getExamsBySubject);
  }
  void _getExamsBySubject(GetExamsByIdEvent event, Emitter emit) async {
    emit(state.copyWith(isLoadding: true));
    ApiResult<List<ExamModelById>> resultResponce =
        await _getExamsBySubjectUseCase.call(event.id);
    switch (resultResponce) {
      case ApiSuccessResult<List<ExamModelById>>():
        emit(
          state.copyWith(
            isLoadding: false,
            examsBySubject: resultResponce.data,
          ),
        );
        break;

      case ApiErrorResult<List<ExamModelById>>():
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
