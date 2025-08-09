import 'package:examapp/api/api_module/api_result.dart';
import 'package:examapp/api/api_service.dart';
import 'package:injectable/injectable.dart';


import '../../../api/model/exams/exam_by_sub.dart';
import '../../../domain/repos/exam/exam_by_sub_repo.dart';
@Injectable(as:ExamBySubRepo)
class ExamBySubRepoImpl extends ExamBySubRepo{
  ApiServices apiServices;
  ExamBySubRepoImpl({required this.apiServices});
  @override
  Future<ApiResult<ExamBySub>> getExam(String subject, int page, int limit)async {
    try {
      final response = await apiServices.getExamsBySubject(
          subject="670037f6728c92b7fdf434fc",
          page=1, limit=10);
      var domain=response.toExamBySub();
      return ApiSuccessResult<ExamBySub>(data: domain);

    } catch (e) {
      return ApiErrorResult<ExamBySub>(
        errorMessage: e.toString(),
        errorCode: null,
      );
    }


   // final response = await apiServices.getExamsBySubject(subject, page, limit);
   // return response;
  }

}