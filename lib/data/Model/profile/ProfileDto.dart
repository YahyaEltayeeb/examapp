import 'package:examapp/api/model/profile/userDto.dart';
import 'package:json_annotation/json_annotation.dart';


part 'ProfileDto.g.dart';

@JsonSerializable()
class ProfileDto {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final UserProfileDto? user;

  ProfileDto ({
    this.message,
    this.user,
  });

  factory ProfileDto.fromJson(Map<String, dynamic> json) {
    return _$ProfileDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProfileDtoToJson(this);
  }
}

@JsonSerializable()


