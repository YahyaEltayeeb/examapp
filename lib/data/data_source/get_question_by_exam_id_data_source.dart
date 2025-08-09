import 'package:examapp/api/model/response/question_model_dto.dart';

abstract class GetQuestionByExamIdDataSource {
  Future<List<QuestionModelDto>> getQuestionByExamId(String examId);
}
