import 'package:examapp/api/model/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponseDto {
  final String message;
  final String token;
  final UserDto user;

  SignupResponseDto({
    required this.message,
    required this.token,
    required this.user,
  });

  factory SignupResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
  

  
  
}
