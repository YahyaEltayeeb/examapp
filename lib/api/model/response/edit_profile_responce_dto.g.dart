// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_responce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileResponceDto _$EditProfileResponceDtoFromJson(
  Map<String, dynamic> json,
) => EditProfileResponceDto(
  message: json['message'] as String,
  user: EditUserModelDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EditProfileResponceDtoToJson(
  EditProfileResponceDto instance,
) => <String, dynamic>{'message': instance.message, 'user': instance.user};
