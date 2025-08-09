import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/responce/question_model.dart';
import 'package:examapp/domain/repos/get_question_by_exam_id_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetQuestionUseCase {
  final GetQuestionByExamIdRepo _getQuestionByExamIdRepo;
  GetQuestionUseCase(this._getQuestionByExamIdRepo);
  Future<ApiResult<List<QuestionModel>>> call(String examId) {
    return _getQuestionByExamIdRepo.getQuestionByExam(examId);
  }
}
