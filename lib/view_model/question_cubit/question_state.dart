import 'package:examapp/domain/Model/responce/question_model.dart';

class GetQuestionState {
  bool isLoadding = false;
  String errorMessage = '';
  List<QuestionModel> question = [];
  GetQuestionState({
    this.errorMessage = '',
    this.isLoadding = false,
    this.question = const [],
  });
  GetQuestionState copyWith({
    bool? isLoadding,
    String? errorMessage,
    List<QuestionModel>? question,
  }) {
    return GetQuestionState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoadding: isLoadding ?? this.isLoadding,
      question: question ?? this.question,
    );
  }
}
