import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  @JsonKey(name: "username")
  final String? username;
  
  @JsonKey(name: "firstName")
  final String? firstName;
  
  @JsonKey(name: "lastName")
  final String? lastName;
  
  @JsonKey(name: "email")
  final String? email;
  
  @JsonKey(name: "phone")
  final String? phone;

  EditProfileRequestDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) {
    return _$EditProfileRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EditProfileRequestDtoToJson(this);
  }
} 