import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  EditProfileRequestDto({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  // fromJson
  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestDtoFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$EditProfileRequestDtoToJson(this);
}
