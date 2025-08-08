import 'package:examapp/api/model/response/question_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_responce_model_dto.g.dart';

@JsonSerializable()
class QuestionResponseModelDto {
  final String message;
  final List<QuestionModelDto> questions;

  QuestionResponseModelDto({required this.message, required this.questions});

  factory QuestionResponseModelDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseModelDtoToJson(this);
}
