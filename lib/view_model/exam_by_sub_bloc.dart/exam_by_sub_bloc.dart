import 'package:bloc/bloc.dart';
import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/responce/exam_model_by_sub.dart';
import 'package:examapp/domain/useCase/exam_by_sub_use_case.dart';
import 'package:examapp/view_model/exam_by_sub_bloc.dart/exam_by_sub_event.dart';
import 'package:examapp/view_model/exam_by_sub_bloc.dart/exam_by_sub_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class ExamBySubBloc extends Bloc<ExamBySubEvent, GetExamsBySubState> {
  ExamBySubBloc(this._examBySubUseCase) : super(GetExamsBySubState()) {
    on<GetExamsBySubEvent>(_getExamBySub);
  }
  final ExamBySubUseCase _examBySubUseCase;
  void _getExamBySub(GetExamsBySubEvent event, Emitter emit) async {
    emit(state.copyWith(isLadding: true));
    ApiResult<List<ExamModelBySub>> resultResponce = await _examBySubUseCase
        .call(event.examSub);
    switch (resultResponce) {
      case ApiSuccessResult<List<ExamModelBySub>>():
        emit(state.copyWith(isLadding: false, examSub: resultResponce.data));
      case ApiErrorResult<List<ExamModelBySub>>():
        emit(
          state.copyWith(
            isLadding: false,
            errorMessage: resultResponce.errorNessage,
          ),
        );
        break;
    }
  }
}
