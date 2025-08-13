import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:examapp/data/Model/RequestLogin.dart';
import 'package:injectable/injectable.dart';
import '../../core/error/Failures.dart';
import '../../data/data_source/sign_in_data_source.dart';
import '../../domain/Model/LoginRequest/LoginRequest.dart';
import '../../domain/Model/LoginResponse/LoginResponse.dart';
import '../api_service.dart';
@Injectable(as:LoginRemoteDataSource)
class LoginRemoteDataSourceIMPL extends LoginRemoteDataSource{
  ApiServices apiService;
  LoginRemoteDataSourceIMPL({required this.apiService});


  @override
  Future<Either<Failures, LoginResponse>> login(LoginRequest request)async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet

        final requestDto = RequestLoginDTO(
          email: request.email,
          password: request.password,
        );


        final responseDto = await apiService.login(requestDto);
        final loginResponse = responseDto.toLoginResponse();

        return Right(loginResponse);



      } else {
        //todo : no internet connection
        return Left(NetworkError(
            errorMessage: 'No Internet Connection, Please Check Internet.'));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}