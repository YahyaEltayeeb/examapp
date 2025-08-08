// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:examapp/domain/Model/responce/exam_result_model.dart';
import 'package:examapp/view_model/get_result_bloc/get_result_event.dart';
import 'package:examapp/view_model/get_result_bloc/get_result_state.dart';
import 'package:injectable/injectable.dart';

import 'package:examapp/domain/useCase/get_exam_result_use_case.dart';

@injectable
class GetExamResultBloc extends Bloc<GetExamResultEvent, GetExamResultState> {
  final GetExamResultsUseCase _getExamResultsUseCase;
  GetExamResultBloc(this._getExamResultsUseCase) : super(GetExamResultState()) {
    on<GetExamResultEvent>(_getExamResult);
  }

  Future<void> _getExamResult(GetExamResultEvent event, Emitter emit) async {
    emit(state.copyWith(isLoadding: true));
    try {
      List<ExamResultEntity> resultResponce = await _getExamResultsUseCase
          .call();
      emit(state.copyWith(isLoadding: false, examResult: resultResponce));
    } catch (e) {
      emit(state.copyWith(isLoadding: false, error: e.toString()));
    }
    {}
  }
}
