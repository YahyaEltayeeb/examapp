import 'package:examapp/domain/Model/responce/exam_result_model.dart';

abstract class ExamResultLocalRepo {
  Future<void> saveExamResult(ExamResultEntity exam);
  Future<List<ExamResultEntity>> getAllExamResults();
}
