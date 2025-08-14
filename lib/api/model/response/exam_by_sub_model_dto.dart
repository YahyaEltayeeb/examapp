import 'package:examapp/domain/Model/responce/exam_model_by_sub.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_by_sub_model_dto.g.dart';

@JsonSerializable()
class ExamModelBySubDto {
  @JsonKey(name: '_id')
  final String id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
  final DateTime createdAt;

  ExamModelBySubDto({
    required this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    required this.createdAt,
  });

  factory ExamModelBySubDto.fromJson(Map<String, dynamic> json) =>
      _$ExamModelBySubDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelBySubDtoToJson(this);
  ExamModelBySub toDomain() {
    return ExamModelBySub(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
    );
  }
}
