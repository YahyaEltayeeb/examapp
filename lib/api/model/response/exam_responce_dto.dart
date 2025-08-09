import 'package:examapp/api/model/response/exam_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_responce_dto.g.dart';

@JsonSerializable()
class ExamResponseDto {
  final String? message;
  final Metadata? metadata;
  final List<ExamModelDto>? exams;

  ExamResponseDto({
    required this.message,
    required this.metadata,
    required this.exams,
  });

  factory ExamResponseDto.fromJson(Map<String, dynamic> json) => _$ExamResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseDtoToJson(this);
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

  factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

