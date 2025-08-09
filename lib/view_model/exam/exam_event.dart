
import 'package:examapp/api/model/exams/exam_by_sub.dart';
import 'package:examapp/api/model/exams/exams.dart';

class ExamState{

  bool isLoadingExam = false;

  List<Exams> exam = <Exams>[];

  String erorrExam="";

  ExamState({

    this.isLoadingExam=true,
    this.exam = const [],
    this.erorrExam="",

});

  ExamState copyWith({
    bool? isLoadingExam,
    List<Exams>? exam,
    String? erorrExam,
  }) {
    return ExamState(
      isLoadingExam: isLoadingExam ?? this.isLoadingExam,
      exam: exam ?? this.exam,
      erorrExam: erorrExam ?? this.erorrExam,
    );
  }
}