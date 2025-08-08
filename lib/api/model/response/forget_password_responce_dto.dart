import 'package:examapp/domain/Model/responce/forget_password_responce.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_responce_dto.g.dart';

@JsonSerializable()
class ForgetPasswordResponceDto {
  final String message;
  final String info;

  ForgetPasswordResponceDto({required this.message, required this.info});

  factory ForgetPasswordResponceDto.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponceDtoToJson(this);

  ForgetPasswordResponce toDomain (ForgetPasswordResponceDto forgetPasswordRequestDto){
    return ForgetPasswordResponce(message: forgetPasswordRequestDto.message);
  }
}
