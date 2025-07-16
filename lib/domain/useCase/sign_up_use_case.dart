import 'package:examapp/domain/model/user_request.dart';
import 'package:examapp/domain/model/user_response.dart';
import 'package:examapp/domain/repos/sign_up_repo.dart';
import 'package:injectable/injectable.dart';
// @injectable
// class SignUpUseCase {
//   final SignUpRepo _signUpRepo;
//   SignUpUseCase(this._signUpRepo);

//   Future<UserResponse> signUpUseCase(UserRequest userRequest) {
//     return _signUpRepo.signUpRepo(userRequest);
//   }
// }
@injectable
class SignUpUseCase {
  final SignUpRepo _signUpRepo;

  SignUpUseCase(this._signUpRepo);

  Future<UserResponse> call(UserRequest userRequest) {
    return _signUpRepo.signUpRepo(userRequest);
  }
}
