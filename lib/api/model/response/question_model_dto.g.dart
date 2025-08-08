// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionModelDto _$QuestionModelDtoFromJson(Map<String, dynamic> json) =>
    QuestionModelDto(
      id: json['_id'] as String?,
      question: json['question'] as String?,
      type: json['type'] as String?,
      correct: json['correct'] as String?,
      subject: json['subject'] == null
          ? null
          : SubjectModelDto.fromJson(json['subject'] as Map<String, dynamic>),
      createdAt: json['createdAt'] as String?,
      answersDto: (json['answers'] as List<dynamic>?)
          ?.map((e) => AnswerModelDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      examDto: json['exam'] == null
          ? null
          : ExamQuationModelDto.fromJson(json['exam'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionModelDtoToJson(QuestionModelDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'type': instance.type,
      'correct': instance.correct,
      'subject': instance.subject,
      'createdAt': instance.createdAt,
      'answers': instance.answersDto,
      'exam': instance.examDto,
    };
