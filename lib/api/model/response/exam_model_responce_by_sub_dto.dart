import 'package:examapp/api/model/response/exam_by_sub_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_model_responce_by_sub_dto.g.dart';

@JsonSerializable()
class ResponceModelExamBySubDto {
  final String message;
  final Metadata metadata;
  final List<ExamModelBySubDto> exams;

  ResponceModelExamBySubDto({
    required this.message,
    required this.metadata,
    required this.exams,
  });

  factory ResponceModelExamBySubDto.fromJson(Map<String, dynamic> json) =>
      _$ResponceModelExamBySubDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResponceModelExamBySubDtoToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
