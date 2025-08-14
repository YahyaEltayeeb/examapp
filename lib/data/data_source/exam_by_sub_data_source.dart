import 'package:examapp/api/model/response/exam_by_sub_model_dto.dart';

abstract class ExamBySubDataSource {
  Future<List<ExamModelBySubDto>> getExamBySub(String examSub);
}
