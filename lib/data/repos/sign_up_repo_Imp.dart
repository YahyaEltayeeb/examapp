import 'package:examapp/data/data_source/sign_up_data_source.dart';
import 'package:examapp/data/data_source/token_local_data_source.dart';

import 'package:examapp/domain/model/request/user_request.dart';
import 'package:examapp/domain/model/responce/user_response.dart';

import 'package:examapp/domain/model/request/user_request.dart';
import 'package:examapp/domain/model/responce/user_response.dart';

import 'package:examapp/domain/repos/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpRepo)
class SignUpRepoImp implements SignUpRepo {
  final SignUpDataSource _signUpDataSource;
  final TokenLocalDataSource _tokenLocalDataSource;

  SignUpRepoImp(this._signUpDataSource, this._tokenLocalDataSource);
  @override
  Future<UserResponse> signUpRepo(UserRequest userRequest) async {
    final response = await _signUpDataSource.signUpDataSource(userRequest);

    await _tokenLocalDataSource.saveToken(response.token);

   


    return response.user;
  }
}
