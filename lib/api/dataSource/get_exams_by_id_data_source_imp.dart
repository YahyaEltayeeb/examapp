import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/response/exam_model_by_id_dto.dart';
import 'package:examapp/data/data_source/get_exams_by_id_data_source.dart';
import 'package:injectable/injectable.dart';

import '../api_service.dart';


@Injectable(as: GetExamsByIdDataSource)
class GetExamsByIdDataSourceImp implements GetExamsByIdDataSource {
  final ApiServices _apiServices;
  GetExamsByIdDataSourceImp(this._apiServices);
  @override
  Future<List<ExamModelByIdDto>> getExamsByid(
    String id,
  ) async {
    final responce = await _apiServices.getExamsById(id);
    return responce.exams ?? [];
  }
}
