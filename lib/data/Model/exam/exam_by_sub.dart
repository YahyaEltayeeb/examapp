import 'package:json_annotation/json_annotation.dart';

import '../../../api/model/exams/exam_by_sub.dart';
import '../../../api/model/exams/exams.dart';
import 'exams.dart';
import 'metadata.dart';

part 'exam_by_sub.g.dart';

@JsonSerializable()
class ExamBySubDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "metadata")
  final MetadataDto? metadata;
  @JsonKey(name: "exams")
  final List<ExamsDto>? exams;

  ExamBySubDto({
    this.message,
    this.metadata,
    this.exams,
  });

  factory ExamBySubDto.fromJson(Map<String, dynamic> json) {
    return _$ExamBySubDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamBySubDtoToJson(this);
  }


  ExamBySub toExamBySub() {
    return ExamBySub(
      message: message,
      exams: exams?.map( (e) => e.toExams() ).toList()??[] ,
      metadata: metadata?.toMetadata()
    );
  }
}



