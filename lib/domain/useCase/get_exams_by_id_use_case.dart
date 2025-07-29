import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/exam_model_by_id.dart';
import 'package:examapp/domain/repos/get_exams_by_id_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetExamsByIdUseCase {
  final GetExamsByIdRepo _getExamsByIdRepo;
  GetExamsByIdUseCase(this._getExamsByIdRepo);
  Future<ApiResult<List<ExamModelById>>> call(String subjectId) {
    return _getExamsByIdRepo.getExamsById(subjectId);
  }
}
