sealed class ExamBySubEvent {}

class GetExamsBySubEvent extends ExamBySubEvent {
  String examSub;
  GetExamsBySubEvent(this.examSub);
}
