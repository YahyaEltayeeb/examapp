import 'package:examapp/api/model/user_dto.dart';
import 'package:examapp/domain/model/responce/sign_up_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response_dto.g.dart';

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
      _$SignupResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseDtoToJson(this);

  SignUpResponse toSignUPDomain(SignupResponseDto signUpResponseDto) {
    return SignUpResponse(
      token: signUpResponseDto.token,
      user: signUpResponseDto.user.toUser(),
    );
  }
}
