// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_model_responce_by_sub_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponceModelExamBySubDto _$ResponceModelExamBySubDtoFromJson(
  Map<String, dynamic> json,
) => ResponceModelExamBySubDto(
  message: json['message'] as String,
  metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  exams: (json['exams'] as List<dynamic>)
      .map((e) => ExamModelBySubDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ResponceModelExamBySubDtoToJson(
  ResponceModelExamBySubDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'exams': instance.exams,
};

Metadata _$MetadataFromJson(Map<String, dynamic> json) => Metadata(
  currentPage: (json['currentPage'] as num).toInt(),
  numberOfPages: (json['numberOfPages'] as num).toInt(),
  limit: (json['limit'] as num).toInt(),
);

Map<String, dynamic> _$MetadataToJson(Metadata instance) => <String, dynamic>{
  'currentPage': instance.currentPage,
  'numberOfPages': instance.numberOfPages,
  'limit': instance.limit,
};
