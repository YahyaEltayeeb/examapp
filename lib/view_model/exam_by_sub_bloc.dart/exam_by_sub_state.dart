import 'package:examapp/domain/Model/responce/exam_model_by_sub.dart';

class GetExamsBySubState {
  bool isLoadding = false;
  String errorMessage = '';
  List<ExamModelBySub> examSub = const [];
  GetExamsBySubState({
    this.errorMessage = '',
    this.examSub = const [],
    this.isLoadding = false,
  });

  GetExamsBySubState copyWith({
    bool? isLadding,
    String? errorMessage,
    List<ExamModelBySub>? examSub,
  }) {
    return GetExamsBySubState(
      isLoadding: isLadding ?? isLoadding,
      errorMessage: errorMessage ?? this.errorMessage,
      examSub: examSub ?? this.examSub,
    );
  }
}
