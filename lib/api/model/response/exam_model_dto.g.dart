// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamModelDto _$ExamModelDtoFromJson(Map<String, dynamic> json) => ExamModelDto(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  subject: json['subject'] as String?,
  numberOfQuestions: (json['numberOfQuestions'] as num?)?.toInt(),
  active: json['active'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ExamModelDtoToJson(ExamModelDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
