// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:examapp/core/error/Failures.dart';
import 'package:examapp/data/data_source/sign_in_data_source.dart';
import 'package:examapp/data/data_source/token_local_data_source.dart';

import '../../domain/Model/LoginRequest/LoginRequest.dart';
import '../../domain/Model/LoginResponse/LoginResponse.dart';
import '../../domain/repo.dart';

@Injectable(as: LoginRepo)
class LoginRepoIMPL implements LoginRepo {
  LoginRemoteDataSource loginRemoteDataSource;
  final TokenLocalDataSource _tokenLocalDataSource;
  LoginRepoIMPL(this.loginRemoteDataSource, this._tokenLocalDataSource);

  @override
  Future<Either<Failures, LoginResponse>> login(LoginRequest request) async {
    var either = await loginRemoteDataSource.login(request);

    return either.fold((error) => Left(error), (response) async {
      if (response.token != null) {
        await _tokenLocalDataSource.saveToken(response.token!);
      }
      return Right(response);
    });
  }
}
