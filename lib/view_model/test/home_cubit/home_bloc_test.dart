import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/exam_model.dart';
import 'package:examapp/domain/useCase/get_all_exams_use_case.dart';
import 'package:examapp/view_model/test/home_cubit/home_event_test.dart';
import 'package:examapp/view_model/test/home_cubit/home_state_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModeltest extends Bloc<HomeEventtest, HomeStatetest> {
  HomeViewModeltest(this._getAllExamsUseCase) : super(HomeStatetest()) {
    on<GetAllExamEventtest>(_getAllExam);
  }
  final GetAllExamsUseCase _getAllExamsUseCase;
  void _getAllExam(GetAllExamEventtest event, Emitter emit) async {
    emit(state.copyWith(isLoaddingGetAllExams: true));
    ApiResult<List<ExamModel>> examsResult = await _getAllExamsUseCase.call();
    switch (examsResult) {
      case ApiSuccessResult<List<ExamModel>>():
        emit(
          state.copyWith(isLoaddingGetAllExams: false, exams: examsResult.data),
        );
        break;
      case ApiErrorResult<List<ExamModel>>():
        emit(
          state.copyWith(
            isLoaddingGetAllExams: false,
            errorGetAllExam: examsResult.errorNessage,
          ),
        );
        break;
    }
  }
}
