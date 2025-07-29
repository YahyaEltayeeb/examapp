import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/response/exam_model_dto.dart';
import 'package:examapp/data/data_source/get_all_exams_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllExamsDataSource)
class GetAllExamsDataSourceImp implements GetAllExamsDataSource {
  final ApiServices _apiServices;
  GetAllExamsDataSourceImp(this._apiServices);
  @override
  Future<List<ExamModelDto>> getAllExams() async {
    var responce = await _apiServices.getAllExams();
    return responce.exams??[];
  }
}
