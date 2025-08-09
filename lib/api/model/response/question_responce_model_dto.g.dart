// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_responce_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionResponseModelDto _$QuestionResponseModelDtoFromJson(
  Map<String, dynamic> json,
) => QuestionResponseModelDto(
  message: json['message'] as String,
  questions: (json['questions'] as List<dynamic>)
      .map((e) => QuestionModelDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuestionResponseModelDtoToJson(
  QuestionResponseModelDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'questions': instance.questions,
};
