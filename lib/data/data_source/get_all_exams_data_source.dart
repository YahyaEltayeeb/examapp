import 'package:examapp/api/model/response/exam_model_dto.dart';

abstract class GetAllExamsDataSource {
  Future<List<ExamModelDto>>getAllExams();
}