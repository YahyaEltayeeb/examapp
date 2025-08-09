import 'package:examapp/data/data_source/exam_result_local_data_source.dart';
import 'package:examapp/domain/Model/responce/exam_result_model.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetExamResultsUseCase {
  final ExamResultLocalDataSource repository;

  GetExamResultsUseCase(this.repository);

  Future<List<ExamResultEntity>> call() async {
    return await repository.getAllExamResult();
  }
}
