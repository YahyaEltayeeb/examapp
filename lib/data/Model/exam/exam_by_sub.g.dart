// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_by_sub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamBySubDto _$ExamBySubDtoFromJson(Map<String, dynamic> json) => ExamBySubDto(
  message: json['message'] as String?,
  metadata: json['metadata'] == null
      ? null
      : MetadataDto.fromJson(json['metadata'] as Map<String, dynamic>),
  exams: (json['exams'] as List<dynamic>?)
      ?.map((e) => ExamsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExamBySubDtoToJson(ExamBySubDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'metadata': instance.metadata,
      'exams': instance.exams,
    };
