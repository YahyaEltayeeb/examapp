import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/exam_model_by_id.dart';

abstract class GetExamsByIdRepo {
  Future<ApiResult<List<ExamModelById>>> getExamsById(String id);
}
