import 'package:examapp/api/model/response/subject_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_responce_dto.g.dart';

@JsonSerializable()
class SubjectResponseDto {
  final String? message;
  final Metadata? metadata;
  final List<SubjectModelDto>? subjects;

  SubjectResponseDto({
     this.message,
     this.metadata,
    required this.subjects,
  });

  factory SubjectResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseDtoToJson(this);
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



