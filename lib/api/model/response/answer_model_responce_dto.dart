import 'package:examapp/domain/Model/responce/answer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'answer_model_responce_dto.g.dart';

@JsonSerializable()
class AnswerModelDto {
  final String? answer;
  final String? key;

  AnswerModelDto({required this.answer, required this.key});

  factory AnswerModelDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelDtoToJson(this);

  AnswerModel toDomain() {
    return AnswerModel(answer: answer ?? '', key: key ?? '');
  }
}
