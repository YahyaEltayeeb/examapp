import 'package:examapp/api/model/response/exam_model_by_id_dto.dart';

abstract class GetExamsByIdDataSource {
  Future<List<ExamModelByIdDto>> getExamsByid(String id);
}
