sealed class ExamByIdEvent {}

class GetExamsByIdEvent extends ExamByIdEvent {
  final String id;
  GetExamsByIdEvent(this.id);
}
