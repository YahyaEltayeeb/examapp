class ExamResultEntity {
  final String examId;
  final String examName;
  final int duration;
  final Map<String, dynamic> userAnswers;

  ExamResultEntity({
    required this.examId,
    required this.examName,
    required this.duration,
    required this.userAnswers,
  });
}
