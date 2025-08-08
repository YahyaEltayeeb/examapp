import 'package:examapp/domain/Model/responce/exam_result_model.dart';
import 'package:examapp/domain/repos/exam_result_local_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class SaveExamResultUseCase {
  final ExamResultLocalRepo repository;

  SaveExamResultUseCase(this.repository);

  Future<void> call(ExamResultEntity exam) async {
    await repository.saveExamResult(exam);
  }
}
