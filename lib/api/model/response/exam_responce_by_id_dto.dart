import 'package:examapp/api/model/response/exam_model_by_id_dto.dart';
import 'package:examapp/api/model/response/exam_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_responce_by_id_dto.g.dart';

@JsonSerializable()
class ExamResponseByIdDto {
  final String? message;
  final Metadata? metadata;
  final List<ExamModelByIdDto>? exams;

  ExamResponseByIdDto({
     this.message,
     this.metadata,
    required this.exams,
  });

  factory ExamResponseByIdDto.fromJson(Map<String, dynamic> json) => _$ExamResponseByIdDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamResponseByIdDtoToJson(this);
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

