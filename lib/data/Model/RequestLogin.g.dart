// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequestLogin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestLoginDTO _$RequestLoginDTOFromJson(Map<String, dynamic> json) =>
    RequestLoginDTO(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$RequestLoginDTOToJson(RequestLoginDTO instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
