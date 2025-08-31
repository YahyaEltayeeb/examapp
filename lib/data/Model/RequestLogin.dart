import 'package:json_annotation/json_annotation.dart';

part 'RequestLogin.g.dart';

@JsonSerializable()
class RequestLoginDTO {
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'password')
  final String? password;

  RequestLoginDTO ({
    this.email,
    this.password,
  });

  factory RequestLoginDTO.fromJson(Map<String, dynamic> json) {
    return _$RequestLoginDTOFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestLoginDTOToJson(this);
  }
}


