import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/request/change_password_request_dto.dart';
import 'package:examapp/api/model/response/change_password_responce_dto.dart';
import 'package:examapp/data/data_source/change_password_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ChangePasswordDataSource)
class ChangePasswordDataSourceImp extends ChangePasswordDataSource {
  final ApiServices _apiServices;
  ChangePasswordDataSourceImp(this._apiServices);

  @override
  Future<ChangePasswordResponceDto> changePasswordDs(
    ChangePasswordRequestDto changePasswordRequestDto,
  ) {
    return _apiServices.changePassword(changePasswordRequestDto);
  }
}
