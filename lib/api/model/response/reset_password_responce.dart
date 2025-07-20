import 'package:examapp/domain/model/responce/reset_password_responce.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_responce.g.dart';

@JsonSerializable()
class ResetPasswordResponceDto {
  final String message;
  final String token;

  ResetPasswordResponceDto({required this.message, required this.token});

  factory ResetPasswordResponceDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponceDtoToJson(this);

  ResetPasswordResponce  toDomain(ResetPasswordResponceDto resetPasswordResponceDto){
    return ResetPasswordResponce(resetPasswordResponceDto.token);
  }
}

