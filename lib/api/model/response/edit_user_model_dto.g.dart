// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserModelDto _$EditUserModelDtoFromJson(Map<String, dynamic> json) =>
    EditUserModelDto(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      password: json['password'] as String?,
      isVerified: json['isVerified'] as bool?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$EditUserModelDtoToJson(EditUserModelDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'password': instance.password,
      'isVerified': instance.isVerified,
      'createdAt': instance.createdAt,
    };
