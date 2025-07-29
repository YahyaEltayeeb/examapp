import 'package:bloc/bloc.dart';
import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/subject_model.dart';
import 'package:examapp/domain/useCase/get_subject_use_case.dart';
import 'package:examapp/view_model/home_cubit/home_event.dart';
import 'package:examapp/view_model/home_cubit/home_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeBloc extends Bloc<GetSubjectEvent, GetSubjectState> {
  final GetSubjectUseCase _getSubjectUseCase;
  HomeBloc(this._getSubjectUseCase) : super(GetSubjectState()) {
    on<GetSubjectEvent>(_getSubject);
  }

  void _getSubject(GetSubjectEvent event, Emitter emit) async {
    emit(state.copyWith(isLoaddingGetAllExams: true));
    ApiResult<List<SubjectModel>> subjectList = await _getSubjectUseCase.call();
    switch (subjectList) {
      case ApiSuccessResult():
        emit(
          state.copyWith(
            isLoaddingGetAllExams: false,
            subjects: subjectList.data,
          ),
        );
        break;
      case ApiErrorResult():
        emit(
          state.copyWith(
            isLoaddingGetAllExams: false,
            messageErrorSubject: state.messageErrorSubject,
          ),
        );
        break;
    }
  }
}
