import 'package:examapp/domain/model/responce/exam_model.dart';

class HomeStatetest {
  bool isLoaddingGetAllExams = false;
  List<ExamModel> exams = <ExamModel>[];
  String errorGetAllExam = '';

  HomeStatetest({
    this.errorGetAllExam = '',
    this.exams = const [],
    this.isLoaddingGetAllExams = false,
  });
  HomeStatetest copyWith({
    bool? isLoaddingGetAllExams,
    List<ExamModel>? exams,
    String? errorGetAllExam ,
  }) {
    return HomeStatetest(
      isLoaddingGetAllExams:
          isLoaddingGetAllExams ?? this.isLoaddingGetAllExams,
      exams: exams ?? this.exams,
      errorGetAllExam: errorGetAllExam ?? this.errorGetAllExam,
    );
  }
}
