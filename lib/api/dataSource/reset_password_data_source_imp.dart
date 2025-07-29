import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/request/reset_password_request.dart';
import 'package:examapp/api/model/response/reset_password_responce.dart';
import 'package:examapp/data/data_source/reset_password_data_source.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ResetPasswordDataSource)

class ResetPasswordDataSourceImp implements ResetPasswordDataSource {
  final ApiServices _apiServices;
  ResetPasswordDataSourceImp(this._apiServices);

  @override
  Future<ResetPasswordResponceDto> resetPassword(
    ResetPasswordRequestDto resetPasswordRequestDto,
  ) {
    return _apiServices.resetPassword(resetPasswordRequestDto);
  }
}
