import '../../data/data_source/forget_password_data_source.dart';
import '../../data/mapper/sign_up_mapper_toDto.dart';
import '../../domain/Model/request/forget_password_request.dart';
import '../../domain/Model/responce/forget_password_responce.dart';
import '../api_service.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordDataSource)
class ForgetPasswordDataSourceImp implements ForgetPasswordDataSource {
  final ApiServices _apiServices;
  
  ForgetPasswordDataSourceImp(this._apiServices);
  
  @override
  Future<ForgetPasswordResponce> forgetPassword(
    ForgetPasswordRequest forgetPasswordRequest,
  ) async {
    var response = await _apiServices.forgetPassword(
      convertForgetPasswordToDto(forgetPasswordRequest),
    );
    return response.toDomain();
  }
}
