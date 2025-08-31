import 'package:examapp/domain/Model/responce/change_password.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_responce_dto.g.dart';

@JsonSerializable()
class ChangePasswordResponceDto {
  final String message;
  final String token;

  ChangePasswordResponceDto({required this.message, required this.token});

  // fromJson
  factory ChangePasswordResponceDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponceDtoFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ChangePasswordResponceDtoToJson(this);

  ChangePassword toDomain(ChangePasswordResponceDto changePasswordResponceDto) {
    return ChangePassword(token: changePasswordResponceDto.token);
  }
}
