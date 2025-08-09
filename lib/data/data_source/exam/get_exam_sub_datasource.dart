

import 'package:examapp/api/api_module/api_result.dart';

import '../../../api/model/exams/exam_by_sub.dart';


abstract class ExamBySubDataSource{

  Future<ApiResult<ExamBySub>> getExam(String subject,int page, int limit);

}