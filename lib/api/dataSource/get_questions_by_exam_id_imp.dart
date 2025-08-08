import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/response/question_model_dto.dart';
import 'package:examapp/data/data_source/get_question_by_exam_id_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetQuestionByExamIdDataSource)
class GetQuestionsByExamIdImp implements GetQuestionByExamIdDataSource {
  final ApiServices _apiServices;
  GetQuestionsByExamIdImp(this._apiServices);
  @override
  Future<List<QuestionModelDto>> getQuestionByExamId(String examId) async {
    var responce = await _apiServices.getQuestions(examId);
    return responce.questions;
  }
}
