import 'package:examapp/core/api_result/api_result.dart';
import 'package:examapp/domain/model/responce/subject_model.dart';
import 'package:examapp/domain/repos/get_subject_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetSubjectUseCase {
  final GetSubjectRepo _getSubjectRepo;
  GetSubjectUseCase(this._getSubjectRepo);
  Future<ApiResult<List<SubjectModel>>> call() {
    return _getSubjectRepo.getSubjectRepo();
  }
}
