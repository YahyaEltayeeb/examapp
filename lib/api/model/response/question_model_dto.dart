import 'package:examapp/api/model/response/answer_model_responce_dto.dart';
import 'package:examapp/api/model/response/exam_question_model_dto.dart';
import 'package:examapp/api/model/response/subject_model_dto.dart';
import 'package:examapp/domain/Model/responce/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_model_dto.g.dart';

@JsonSerializable()
class QuestionModelDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? question;
  final String? type;
  final String? correct;
  final SubjectModelDto? subject;
  final String? createdAt;
  @JsonKey(name: 'answers')
  final List<AnswerModelDto>? answersDto;
  @JsonKey(name: 'exam')
  final ExamQuationModelDto? examDto;

  QuestionModelDto({
    required this.id,
    required this.question,
    required this.type,
    required this.correct,
    required this.subject,
    required this.createdAt,
    required this.answersDto,
    required this.examDto,
  });

  factory QuestionModelDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionModelDtoToJson(this);

  QuestionModel toDomain() {
    return QuestionModel(
      id: id ?? '',
      question: question ?? '',
      type: type ?? '',
      correct: correct ?? '',
      answers: answersDto?.map((e) => e.toDomain()).toList()??[],
     exam: examDto!.toDomain()
    
    );
  }
}
