

import 'package:examapp/api/api_module/api_result.dart';
import 'package:examapp/api/model/exams/exam_by_sub.dart';
import 'package:examapp/domain/repos/exam/exam_by_sub_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExamBySubUseCase{

  ExamBySubRepo examBySubRepo;
  ExamBySubUseCase({required this.examBySubRepo});

  Future<ApiResult<ExamBySub>> invoke(String subject,int page,int limit){
    return examBySubRepo.getExam(subject, page, limit);
  }

}