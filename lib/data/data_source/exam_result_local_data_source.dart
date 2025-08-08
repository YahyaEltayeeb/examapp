import 'package:examapp/data/Model/exam_result_model.dart';

abstract class ExamResultLocalDataSource {
  Future<void> saveExamResult(ExamResultModel exam);
  Future<List<ExamResultModel>> getAllExamResult();
}
