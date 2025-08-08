import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/responce/question_model.dart';

abstract class GetQuestionByExamIdRepo {
  Future<ApiResult<List<QuestionModel>>> getQuestionByExam(String examId);
}
