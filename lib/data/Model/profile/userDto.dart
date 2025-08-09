import 'package:examapp/domain/Model/profile/userDto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'userDto.g.dart';

@JsonSerializable()
class UserProfileDto {

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
  @JsonKey(name: "password")
  final String? password;



  UserProfileDto ({

    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  UserProfileDto.fromDomain(UserProfile userProfile)
      :username = userProfile.username,
        firstName = userProfile.firstName,
        lastName = userProfile.lastName,
        email = userProfile.email,
        phone = userProfile.phone,
        password = userProfile.password;



  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    return _$UserProfileDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserProfileDtoToJson(this);
  }
  UserProfile toUser(){
    return UserProfile(
      email: email,
       firstName: firstName,
      lastName: lastName,
      password: password,
      phone: phone,
      username: username,

    );
  }

  UserProfile toDomain(){
    return UserProfile(
      email: email,
      firstName: firstName,
      lastName: lastName,
      password: password,
      phone: phone,
      username: username,
    );
  }

}
