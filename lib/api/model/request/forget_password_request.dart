import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
  final String email;

  ForgetPasswordRequestDto({required this.email});

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestDtoToJson(this);
}

