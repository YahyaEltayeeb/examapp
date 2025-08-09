import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/exam_model.dart';
import 'package:examapp/domain/repos/get_all_exams_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAllExamsUseCase {
  final GetAllExamsRepo _getAllExamsRepo;
  GetAllExamsUseCase(this._getAllExamsRepo);
  Future<ApiResult<List<ExamModel>>> call() {
    return _getAllExamsRepo.getAllExams();
  }
}
