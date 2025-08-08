import 'package:examapp/domain/Model/responce/exam_result_model.dart';

class ExamResultModel extends ExamResultEntity {
  ExamResultModel({
    required super.examId,
    required super.examName,
    required super.duration,
    required super.userAnswers,
  });

  factory ExamResultModel.fromJson(Map<String, dynamic> json) {
    return ExamResultModel(
      examId: json['examId'],
      examName: json['examName'],
      duration: json['duration'],
      userAnswers: Map<String, dynamic>.from(json['userAnswers']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'examId': examId,
      'examName': examName,
      'duration': duration,
      'userAnswers': userAnswers,
    };
  }
}
