// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:examapp/domain/model/responce/exam_model_by_id.dart';

class GetExamByIdState {
  bool isLoadding = false;
 late String errorMessageId = '';
  List<ExamModelById> examsById = [];
  GetExamByIdState({
    this.isLoadding=false,
    this.errorMessageId='',
    this.examsById=const [],
  });
  GetExamByIdState copyWith({
    bool? isLoadding,
    String? errorMessage,
    List<ExamModelById>? examsBySubject,
  }) {
    return GetExamByIdState(
      isLoadding: isLoadding ?? this.isLoadding,
      errorMessageId: errorMessage ?? errorMessageId,
      examsById: examsBySubject ?? examsById,
    );
  }
}
