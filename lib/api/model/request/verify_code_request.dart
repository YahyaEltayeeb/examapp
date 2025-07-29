import 'package:json_annotation/json_annotation.dart';

part 'verify_code_request.g.dart';

@JsonSerializable()
class VerifyCodeRequestDto {
   final String resetCode;

  VerifyCodeRequestDto({required this.resetCode});

  factory VerifyCodeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeRequestDtoToJson(this);
}
