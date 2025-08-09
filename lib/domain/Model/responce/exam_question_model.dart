class ExamQuestionModel {
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  ExamQuestionModel({
    required this.duration,
    required this.id,
    required this.numberOfQuestions,
    required this.subject,
    required this.title,
  });
}
