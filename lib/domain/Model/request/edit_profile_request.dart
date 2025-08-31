class EditProfileRequest {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  EditProfileRequest({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });
}
