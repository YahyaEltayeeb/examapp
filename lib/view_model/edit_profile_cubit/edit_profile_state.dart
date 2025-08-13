
import 'package:examapp/domain/Model/profile/ProfileDto.dart';

class EditProfileState{

  bool isLoadingProfile = false;

  List<Profile> profile = <Profile>[];

  String errorProfile="";

  EditProfileState({

    this.isLoadingProfile=true,
    this.profile = const [],
    this.errorProfile="",

  });

  EditProfileState copyWith({
    bool? isLoadingProfile,
    List<Profile>? profile,
    String? errorProfile,
  }) {
    return EditProfileState(
      isLoadingProfile: isLoadingProfile ?? this.isLoadingProfile,
      profile: profile ?? this.profile,
      errorProfile: errorProfile ?? this.errorProfile,
    );
  }
}