import 'package:examapp/domain/Model/responce/edit_user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'edit_user_model_dto.g.dart';

@JsonSerializable()
class EditUserModelDto {
  @JsonKey(name: '_id')
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final String? password;
  final bool? isVerified;
  final String? createdAt;

  EditUserModelDto({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    required this.password,
    required this.isVerified,
    required this.createdAt,
  });

  factory EditUserModelDto.fromJson(Map<String, dynamic> json) =>
      _$EditUserModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditUserModelDtoToJson(this);

  EditUserModel toDomain() {
    return EditUserModel(
      username: username ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      phone: phone ?? '',
      password: password ?? '',
    );
  }
}
