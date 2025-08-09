import 'package:examapp/data/data_source/forget_password_data_source.dart';
import 'package:examapp/domain/Model/request/forget_password_request.dart';
import 'package:examapp/domain/Model/responce/forget_password_responce.dart';

import 'package:examapp/domain/repos/forget_password_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ForgetPasswordRepo)
class ForgetPasswordRepoImp implements ForgetPasswordRepo {
  final ForgetPasswordDataSource _forgetPasswordDataSource;
  ForgetPasswordRepoImp(this._forgetPasswordDataSource);
  @override
  Future<ForgetPasswordResponce> forgetPasswordRepo(
    ForgetPasswordRequest forgetPasswordRequest,
  ) {
    return _forgetPasswordDataSource.forgetPassword(forgetPasswordRequest);
  }
}
