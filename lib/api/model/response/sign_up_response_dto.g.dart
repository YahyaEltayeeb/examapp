// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseDto _$SignupResponseDtoFromJson(Map<String, dynamic> json) =>
    SignupResponseDto(
      message: json['message'] as String,
      token: json['token'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupResponseDtoToJson(SignupResponseDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
