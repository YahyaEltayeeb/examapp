import 'package:json_annotation/json_annotation.dart';

import '../../domain/Model/LoginResponse/LoginResponse.dart';
import 'UserDto.dart';

part 'ResponseLogin.g.dart';

@JsonSerializable()
class ResponseLoginDTO {
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'token')
  final String? token;
  @JsonKey(name: 'user')
  final UserDTO? user;
  ResponseLoginDTO ({
    this.message,
    this.token,
    this.user,
  });

  factory ResponseLoginDTO.fromJson(Map<String, dynamic> json) {
    return _$ResponseLoginDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResponseLoginDTOToJson(this);
  }
  LoginResponse toLoginResponse() {
    return LoginResponse(
      message: message,
      token: token,
      user: user?.toUser(), // هنا بنستخدم toUser() من UserDTO
    );
  }

}

// @JsonSerializable()
// class User {
//   @JsonKey(name: "_id")
//   final String? Id;
//   @JsonKey(name: "username")
//   final String? username;
//   @JsonKey(name: "firstName")
//   final String? firstName;
//   @JsonKey(name: "lastName")
//   final String? lastName;
//   @JsonKey(name: "email")
//   final String? email;
//   @JsonKey(name: "phone")
//   final String? phone;
//   @JsonKey(name: "role")
//   final String? role;
//   @JsonKey(name: "isVerified")
//   final bool? isVerified;
//   @JsonKey(name: "createdAt")
//   final String? createdAt;
//
//   User ({
//     this.Id,
//     this.username,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.role,
//     this.isVerified,
//     this.createdAt,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return _$UserFromJson(json);
//   }
//
//   Map<String, dynamic> toJson() {
//     return _$UserToJson(this);
//   }
// }


