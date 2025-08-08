
import '../../api/model/response/subject_model_dto.dart';

abstract class GetSubjectsDataSource {
  Future<List<SubjectModelDto>>getSubject();
}