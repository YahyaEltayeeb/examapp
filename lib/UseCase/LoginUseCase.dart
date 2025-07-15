import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../domain/Model/LoginRequest/LoginRequest.dart';
import '../domain/Model/LoginResponse/LoginResponse.dart';
import '../domain/repo.dart';
import '../core/error/Failures.dart';

@injectable
class LoginUseCase{

  LoginRepo loginRepo;
  LoginUseCase({required this.loginRepo});

  Future<Either<Failures, LoginResponse>> invoke(LoginRequest request){
   return loginRepo.login(request);
  }

}