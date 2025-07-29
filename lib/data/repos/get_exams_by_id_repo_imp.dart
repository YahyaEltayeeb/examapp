import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/get_exams_by_id_data_source.dart';
import 'package:examapp/domain/model/responce/exam_model_by_id.dart';
import 'package:examapp/domain/repos/get_exams_by_id_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetExamsByIdRepo)
class GetExamsByIdRepoImp implements GetExamsByIdRepo {
  final GetExamsByIdDataSource _getExamsByIdDataSource;
  GetExamsByIdRepoImp(this._getExamsByIdDataSource);

  @override
  Future<ApiResult<List<ExamModelById>>> getExamsById(
    String subjectId,
  ) async {
    try {
      var responce = await _getExamsByIdDataSource.getExamsByid(
        subjectId,
      );
      var convertToExamModelById = responce
          .map((e) => e.toDomain())
          .toList();
      return ApiSuccessResult(convertToExamModelById);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
