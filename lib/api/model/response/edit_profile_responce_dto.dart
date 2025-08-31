import 'package:examapp/api/model/response/edit_user_model_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'edit_profile_responce_dto.g.dart';
@JsonSerializable()
class EditProfileResponceDto {
  final String message;
  final EditUserModelDto user;

  EditProfileResponceDto({
    required this.message,
    required this.user,
  });

  factory EditProfileResponceDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileResponceDtoToJson(this);
}