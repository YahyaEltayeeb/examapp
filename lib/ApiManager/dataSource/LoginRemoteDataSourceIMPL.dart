import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:examapp/ApiService/Model/LoginRequest/LoginRequest.dart';

import 'package:examapp/ApiService/Model/LoginResponse/LoginResponse.dart';

import 'package:examapp/error/Failures.dart';

import '../../data/dataSource/remote_datasource.dart';
import '../ApiService.dart';

class LoginRemoteDataSourceIMPL extends LoginRemoteDataSource{
  ApiService apiService;
  LoginRemoteDataSourceIMPL({required this.apiService});


  @override
  Future<Either<Failures, LoginResponse>> login(LoginRequest request)async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        //todo: internet
         var response = await apiService.login(request);
         return  R;


        // var loginResponse = LoginResponse.fromJson(response.user);

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

}