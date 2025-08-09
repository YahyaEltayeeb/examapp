import 'package:examapp/domain/Model/responce/exam_result_model.dart';

abstract class SaveResultEvent {}

class SaveExamResultEvent extends SaveResultEvent {
  final ExamResultEntity exam;

  SaveExamResultEvent(this.exam);
}
