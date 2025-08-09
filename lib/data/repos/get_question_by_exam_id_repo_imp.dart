import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/get_question_by_exam_id_data_source.dart';
import 'package:examapp/domain/Model/responce/question_model.dart';
import 'package:examapp/domain/repos/get_question_by_exam_id_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetQuestionByExamIdRepo)
class GetQuestionByExamIdRepoImp implements GetQuestionByExamIdRepo {
  final GetQuestionByExamIdDataSource _getQuestionByExamIdDataSource;
  GetQuestionByExamIdRepoImp(this._getQuestionByExamIdDataSource);

  @override
  Future<ApiResult<List<QuestionModel>>> getQuestionByExam(
    String examId,
  ) async {
    try {
      var responce = await _getQuestionByExamIdDataSource.getQuestionByExamId(
        examId,
      );
      var convertToQuestionModel = responce.map((e) => e.toDomain()).toList();
      return ApiSuccessResult(convertToQuestionModel);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
