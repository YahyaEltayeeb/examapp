import 'package:dartz/dartz.dart';
import 'package:examapp/data/data_source/sign_in_data_source.dart';
import 'package:examapp/core/error/Failures.dart';
import 'package:injectable/injectable.dart';
import '../../domain/Model/LoginRequest/LoginRequest.dart';
import '../../domain/Model/LoginResponse/LoginResponse.dart';
import '../../domain/repo.dart';

@Injectable(as:LoginRepo)
class LoginRepoIMPL implements LoginRepo{
  LoginRemoteDataSource loginRemoteDataSource;
  LoginRepoIMPL({required this.loginRemoteDataSource});

  @override
  Future<Either<Failures, LoginResponse>> login(LoginRequest request) async{
   var either =await loginRemoteDataSource.login(request);
   return either.fold((error)=>Left(error), (response)=>Right(response));
  }
  
}