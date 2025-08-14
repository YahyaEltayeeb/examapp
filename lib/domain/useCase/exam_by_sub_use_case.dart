import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/Model/responce/exam_model_by_sub.dart';
import 'package:examapp/domain/repos/exam_by_sub_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class ExamBySubUseCase {
  final ExamBySubRepo _examBySubRepo;
  ExamBySubUseCase(this._examBySubRepo);
  Future<ApiResult<List<ExamModelBySub>>> call(String examSub) {
    return _examBySubRepo.getExamsBySub(examSub);
  }
}
