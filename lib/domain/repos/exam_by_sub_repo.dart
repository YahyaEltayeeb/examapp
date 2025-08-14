import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/responce/exam_model_by_sub.dart';

abstract class ExamBySubRepo {
  Future<ApiResult<List<ExamModelBySub>>> getExamsBySub(String examSub);
}
