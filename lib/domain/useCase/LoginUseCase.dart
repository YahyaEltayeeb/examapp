import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../Model/LoginRequest/LoginRequest.dart';
import '../Model/LoginResponse/LoginResponse.dart';
import '../repo.dart';
import '../../core/error/Failures.dart';

@injectable
class LoginUseCase{

  LoginRepo loginRepo;
  LoginUseCase({required this.loginRepo});

  Future<Either<Failures, LoginResponse>> invoke(LoginRequest request){
   return loginRepo.login(request);
  }

}