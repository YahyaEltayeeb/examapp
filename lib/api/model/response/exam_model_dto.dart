import 'package:examapp/domain/model/responce/exam_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_model_dto.g.dart';

@JsonSerializable()
class ExamModelDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  ExamModelDto({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  factory ExamModelDto.fromJson(Map<String, dynamic> json) =>
      _$ExamModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelDtoToJson(this);

  ExamModel toDomain() {
    return 
      ExamModel(title:title??'', subject: subject??'')
    ;
  }

 
}
