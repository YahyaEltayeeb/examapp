sealed class QuestionEvent {}

class GetQuestionEvevnt extends QuestionEvent {
  final String examId;
  GetQuestionEvevnt(this.examId);
}
