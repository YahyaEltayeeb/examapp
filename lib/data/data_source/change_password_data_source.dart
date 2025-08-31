import 'package:examapp/api/model/request/change_password_request_dto.dart';
import 'package:examapp/api/model/response/change_password_responce_dto.dart';

abstract class ChangePasswordDataSource {
  Future<ChangePasswordResponceDto> changePasswordDs(
    ChangePasswordRequestDto changePasswordRequestDto,
  );
}
