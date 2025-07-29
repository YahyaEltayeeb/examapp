import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/exam_model.dart';

abstract class GetAllExamsRepo {
  Future<ApiResult<List<ExamModel>>>getAllExams();
}