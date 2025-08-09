import 'package:examapp/domain/model/responce/subject_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'subject_model_dto.g.dart';
@JsonSerializable()
class SubjectModelDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;

  SubjectModelDto({
     this.id,
     this.name,
     this.icon,
     this.createdAt,
  });

  factory SubjectModelDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelDtoToJson(this);

  SubjectModel toDomain() {
    return SubjectModel(id: id??'', name: name??'', icon: icon??'');
  }
}
