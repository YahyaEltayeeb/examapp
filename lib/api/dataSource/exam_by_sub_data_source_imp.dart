import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/response/exam_by_sub_model_dto.dart';
import 'package:examapp/data/data_source/exam_by_sub_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamBySubDataSource)
class ExamBySubDataSourceImp implements ExamBySubDataSource {
  final ApiServices _apiServices;
  ExamBySubDataSourceImp(this._apiServices);

  @override
  Future<List<ExamModelBySubDto>> getExamBySub(String examSub) async {
    var responce = await _apiServices.getExamBySub(examSub);
    return responce.exams;
  }
}
