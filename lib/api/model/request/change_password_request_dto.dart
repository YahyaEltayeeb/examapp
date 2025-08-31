import 'package:json_annotation/json_annotation.dart';

part 'change_password_request_dto.g.dart';

@JsonSerializable()
class ChangePasswordRequestDto {
  final String oldPassword;
  final String password;
  final String rePassword;

  ChangePasswordRequestDto({
    required this.oldPassword,
    required this.password,
    required this.rePassword,
  });

  // fromJson
  factory ChangePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestDtoFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ChangePasswordRequestDtoToJson(this);
}
