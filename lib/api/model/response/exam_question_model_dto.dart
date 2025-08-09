import 'package:examapp/domain/Model/responce/exam_question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_question_model_dto.g.dart';

@JsonSerializable()
class ExamQuationModelDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;

  ExamQuationModelDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamQuationModelDto.fromJson(Map<String, dynamic> json) =>
      _$ExamQuationModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamQuationModelDtoToJson(this);

  ExamQuestionModel toDomain() {
    return ExamQuestionModel(
      numberOfQuestions: numberOfQuestions ?? 0,
      duration: duration ?? 0,
      id: id ?? '',
      subject: subject ?? '',
      title: title ?? '',
    );
  }
}
