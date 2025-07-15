import 'package:examapp/api/api_service.dart';
import 'package:examapp/data/data_source/sign_up_data_source.dart';
import 'package:examapp/data/mapper/mapper_toDto.dart';
import 'package:examapp/domain/model/user_request.dart';
import 'package:examapp/domain/model/user_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignUpDataSource)
class SignUpDataSourceImp implements SignUpDataSource {
  final ApiServices _apiServices;
  SignUpDataSourceImp(this._apiServices);
  @override
  Future<UserResponse> signUpDataSource(UserRequest userRequest) async {
    var response = await _apiServices.signUp(
      convertUserRequestToDto(userRequest),
    );
    return response.user.toUser();
  }
}
