import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/subject_model.dart';

abstract class GetSubjectRepo {
  Future<ApiResult<List<SubjectModel>>> getSubjectRepo();
}
