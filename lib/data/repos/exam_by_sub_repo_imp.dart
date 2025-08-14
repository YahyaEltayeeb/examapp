import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/exam_by_sub_data_source.dart';
import 'package:examapp/domain/Model/responce/exam_model_by_sub.dart';
import 'package:examapp/domain/repos/exam_by_sub_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ExamBySubRepo)
class ExamBySubRepoImp implements ExamBySubRepo {
  final ExamBySubDataSource _examBySubDataSource;
  ExamBySubRepoImp(this._examBySubDataSource);
  @override
  Future<ApiResult<List<ExamModelBySub>>> getExamsBySub(String examSub) async {
    try {
      var responce = await _examBySubDataSource.getExamBySub(examSub);
      var convertToExamModel = responce.map((e) => e.toDomain()).toList();
      return ApiSuccessResult(convertToExamModel);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
