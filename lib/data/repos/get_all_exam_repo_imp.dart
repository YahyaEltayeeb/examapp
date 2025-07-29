import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/get_all_exams_data_source.dart';
import 'package:examapp/domain/model/responce/exam_model.dart';
import 'package:examapp/domain/repos/get_all_exams_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetAllExamsRepo)
class GetAllExamRepoImp extends GetAllExamsRepo {
  final GetAllExamsDataSource _getAllExamsDataSource;
  GetAllExamRepoImp(this._getAllExamsDataSource);
  @override
  Future<ApiResult<List<ExamModel>>> getAllExams() async {
    try {
      var responce = await _getAllExamsDataSource.getAllExams();
      var convertToResponceModel = responce.map((e) =>e.toDomain()).toList();

      return ApiSuccessResult(convertToResponceModel);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
