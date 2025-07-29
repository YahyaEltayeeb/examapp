import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/response/subject_model_dto.dart';
import 'package:examapp/data/data_source/get_subjects_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetSubjectsDataSource)
class GetSubjectDataSourceImp implements GetSubjectsDataSource {
  final ApiServices _apiServices;
  GetSubjectDataSourceImp(this._apiServices);

  @override
  Future<List<SubjectModelDto>> getSubject() async {
    var response = await _apiServices.getSubject();
    return response.subjects??[];
  }
}
