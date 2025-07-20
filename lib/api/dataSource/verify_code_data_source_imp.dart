import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/request/verify_code_request.dart';
import 'package:examapp/data/data_source/verify_code_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyCodeDataSource)
class VerifyCodeDataSourceImp implements VerifyCodeDataSource {
  final ApiServices _apiServices;
  VerifyCodeDataSourceImp(this._apiServices);

  @override
  Future<void> verifyCode(VerifyCodeRequestDto verifycodeRequestDto) {
    return _apiServices.verifyCode(verifycodeRequestDto);
  }
}
