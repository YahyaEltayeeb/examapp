import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/data/data_source/get_subjects_data_source.dart';
import 'package:examapp/domain/model/responce/subject_model.dart';
import 'package:examapp/domain/repos/get_subject_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: GetSubjectRepo)
class GetSubjectRepoImp implements GetSubjectRepo {
  final GetSubjectsDataSource _getSubjectsDataSource;
  GetSubjectRepoImp(this._getSubjectsDataSource);
  @override
  Future<ApiResult<List<SubjectModel>>> getSubjectRepo() async {
    try {
      var responce = await _getSubjectsDataSource.getSubject();
      var converToSubjectModel = responce.map((e) => e.toDomain()).toList();

      return ApiSuccessResult(converToSubjectModel);
    } catch (e) {
      return ApiErrorResult(e.toString());
    }
  }
}
