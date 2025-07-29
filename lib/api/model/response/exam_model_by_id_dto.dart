import 'package:examapp/domain/model/responce/exam_model_by_id.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_model_by_id_dto.g.dart';

@JsonSerializable()
class ExamModelByIdDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final DateTime? createdAt;

  ExamModelByIdDto({
     this.id,
     this.title,
     this.duration,
     this.subject,
     this.numberOfQuestions,
     this.active,
     this.createdAt,
  });

  factory ExamModelByIdDto.fromJson(Map<String, dynamic> json) =>
      _$ExamModelByIdDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamModelByIdDtoToJson(this);

  ExamModelById toDomain() {
    return ExamModelById(
      title: title ?? '',
      subject: subject ?? '',
      id: id ?? '',
      numberOfQuestions: numberOfQuestions ?? 0,
      duration: duration ?? 0,
    );
  }
}
