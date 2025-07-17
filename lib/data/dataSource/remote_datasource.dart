import 'package:dartz/dartz.dart';
import '../../domain/Model/LoginRequest/LoginRequest.dart';
import '../../domain/Model/LoginResponse/LoginResponse.dart';
import '../../error/Failures.dart';

abstract class LoginRemoteDataSource {

  Future<Either<Failures,LoginResponse>> login(LoginRequest request);
}