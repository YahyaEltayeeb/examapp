import 'package:examapp/api/api_service.dart';
import 'package:examapp/data/data_source/sign_up_data_source.dart';
import 'package:examapp/data/mapper/sign_up_mapper_toDto.dart';
import 'package:examapp/domain/Model/request/user_request.dart';
import 'package:examapp/domain/Model/responce/sign_up_response.dart';

import 'package:injectable/injectable.dart';
@Injectable(as: SignUpDataSource)
class SignUpDataSourceImp implements SignUpDataSource {
  final ApiServices _apiServices;
  SignUpDataSourceImp(this._apiServices);
  @override
  Future<SignUpResponse> signUpDataSource(UserRequest userRequest) async {
    var response = await _apiServices.signUp(
      convertUserRequestToDto(userRequest),
    );
    return response.toSignUPDomain(response);
  }
}
