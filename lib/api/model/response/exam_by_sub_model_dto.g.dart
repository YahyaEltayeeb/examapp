// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_by_sub_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamModelBySubDto _$ExamModelBySubDtoFromJson(Map<String, dynamic> json) =>
    ExamModelBySubDto(
      id: json['_id'] as String,
      title: json['title'] as String,
      duration: (json['duration'] as num).toInt(),
      subject: json['subject'] as String,
      numberOfQuestions: (json['numberOfQuestions'] as num).toInt(),
      active: json['active'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ExamModelBySubDtoToJson(ExamModelBySubDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'subject': instance.subject,
      'numberOfQuestions': instance.numberOfQuestions,
      'active': instance.active,
      'createdAt': instance.createdAt.toIso8601String(),
    };
