import 'package:json_annotation/json_annotation.dart';

import '../../domain/Model/UserResponse/UserResponse.dart';

part 'UserDto.g.dart';

@JsonSerializable()
class UserDTO {
  @JsonKey(name: "_id")
  final String? Id;
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
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "isVerified")
  final bool? isVerified;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  UserDTO ({
    this.Id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return _$UserDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDTOToJson(this);
  }

User toUser() {
  return User(
    email: email,
    Id:Id,
    username:username,
    firstName:firstName,
    lastName:lastName,
    phone:phone,
    role:role,
    isVerified:isVerified,
    createdAt:createdAt,
  );
}
}