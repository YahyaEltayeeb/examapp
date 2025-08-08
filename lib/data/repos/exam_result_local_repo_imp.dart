import 'package:examapp/data/Model/exam_result_model.dart';
import 'package:examapp/data/data_source/exam_result_local_data_source.dart';
import 'package:examapp/domain/Model/responce/exam_result_model.dart';
import 'package:examapp/domain/repos/exam_result_local_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamResultLocalRepo)
class ExamResultLocalRepoImp implements ExamResultLocalRepo {
  final ExamResultLocalDataSource localDataSource;
  ExamResultLocalRepoImp(this.localDataSource);
  @override
  Future<List<ExamResultEntity>> getAllExamResults() async {
    return await localDataSource.getAllExamResult();
  }

  @override
  Future<void> saveExamResult(ExamResultEntity exam) async {
    final model = ExamResultModel(
      examId: exam.examId,
      examName: exam.examName,
      duration: exam.duration,
      userAnswers: exam.userAnswers,
    );
    await localDataSource.saveExamResult(model);
  }
}
