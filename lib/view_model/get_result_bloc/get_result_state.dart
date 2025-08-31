import 'package:examapp/domain/Model/responce/exam_result_model.dart';

class GetExamResultState {
  final bool isLadding;
  final List<ExamResultEntity> examResult;
  final String error;

  GetExamResultState({
    this.isLadding = false,
    this.examResult = const [],
    this.error = '',
  });

  GetExamResultState copyWith({
    bool? isLoadding,
    List<ExamResultEntity>? examResult,
    String? error,
  }) {
    return GetExamResultState(
      isLadding: isLoadding ?? isLadding,
      examResult: examResult ?? this.examResult,
      error: error ?? this.error,
    );
  }
}
