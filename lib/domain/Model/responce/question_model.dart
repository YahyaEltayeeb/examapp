import 'package:examapp/domain/Model/responce/answer_model.dart';
import 'package:examapp/domain/Model/responce/exam_question_model.dart';

class QuestionModel {
  final String id;
  final String question;
  final String type;
  final String correct;
  final List<AnswerModel> answers;
  final ExamQuestionModel exam;

  QuestionModel({
    required this.id,
    required this.question,
    required this.type,
    required this.correct,
    required this.answers,
    required this.exam,
  });
}
