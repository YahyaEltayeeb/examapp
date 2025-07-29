// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResponseLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseLoginDTO _$ResponseLoginDTOFromJson(Map<String, dynamic> json) =>
    ResponseLoginDTO(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseLoginDTOToJson(ResponseLoginDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
