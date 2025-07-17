
import 'package:dartz/dartz.dart';

import '../error/Failures.dart';
import 'Model/LoginRequest/LoginRequest.dart';
import 'Model/LoginResponse/LoginResponse.dart';

abstract class LoginRepo {
  Future<Either<Failures,LoginResponse>> login(LoginRequest request);
}