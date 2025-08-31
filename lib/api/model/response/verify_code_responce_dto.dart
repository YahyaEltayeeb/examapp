import 'package:examapp/domain/Model/responce/verify_code_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_code_responce_dto.g.dart';

@JsonSerializable()
class VerifyCodeResponseDto {
  final String status;

  VerifyCodeResponseDto({required this.status});

  factory VerifyCodeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeResponseDtoToJson(this);

  VerifyCodeModel toDomain(){
    return VerifyCodeModel(status:status );
  }


}
