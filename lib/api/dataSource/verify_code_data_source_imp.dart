import 'package:examapp/api/api_service.dart';
import 'package:examapp/api/model/request/verify_code_request.dart';
import 'package:examapp/api/model/response/verify_code_responce_dto.dart';
import 'package:examapp/data/data_source/verify_code_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: VerifyCodeDataSource)
class VerifyCodeDataSourceImp implements VerifyCodeDataSource {
  final ApiServices _apiServices;
  VerifyCodeDataSourceImp(this._apiServices);

  @override
  Future<VerifyCodeResponseDto> verifyCode(VerifyCodeRequestDto verifycodeRequestDto)async {
    return await _apiServices.verifyCode(verifycodeRequestDto);
  }
}
