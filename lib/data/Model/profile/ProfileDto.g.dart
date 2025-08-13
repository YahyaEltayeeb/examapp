// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDto _$ProfileDtoFromJson(Map<String, dynamic> json) => ProfileDto(
  message: json['message'] as String?,
  user: json['user'] == null
      ? null
      : UserProfileDto.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProfileDtoToJson(ProfileDto instance) =>
    <String, dynamic>{'message': instance.message, 'user': instance.user};
