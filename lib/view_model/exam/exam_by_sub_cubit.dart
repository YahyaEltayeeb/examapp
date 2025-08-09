import 'package:bloc/bloc.dart';
import 'package:examapp/domain/useCase/exam/exam_by_sub_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../api/api_module/api_result.dart';
import '../../api/model/exams/exam_by_sub.dart';
import 'exam_event.dart';

@injectable
class ExamBySubViewModel extends Cubit<ExamState>{
  ExamBySubUseCase examBySubUseCase;
  ExamBySubViewModel({required this.examBySubUseCase})
  :super (ExamState());

  Future<void> getExam(String subject, int page, int limit) async {
    emit(state.copyWith(isLoadingExam: true));

    final result = await examBySubUseCase.invoke(subject, page, limit);

    if (result is ApiSuccessResult<ExamBySub>) {
      print('✅ Exams Loaded: ${result.data}');

      emit(state.copyWith(
        isLoadingExam: false,
        exam: result.data.exams ?? [],
      ));
    } else if (result is ApiErrorResult) {
      print('❌ Error: ${state.erorrExam}');

      emit(state.copyWith(
        isLoadingExam: false,
        erorrExam: state.erorrExam ,
      ));
    }
  }















  // Future<void>getExam(String subject,int page, int limit )async{
  //   // emit(state.copyWith(isLoadingExam: true));
  //   // List<ExamBySub>examList= await examBySubUseCase.invoke(subject, page, limit)  ;
  //   // emit(state.copyWith(isLoadingExam: false,exam: examList));
  //   emit(state.copyWith(isLoadingExam: true));
  //
  //   final result = await examBySubUseCase.invoke(subject, page, limit);
  //
  //    emit(state.copyWith(isLoadingExam: false,exam: result));
  //
  //
  // }
  // }



}