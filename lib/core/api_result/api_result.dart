import 'package:equatable/equatable.dart';

sealed class ApiResult<T> {}

class ApiSuccessResult<T> extends ApiResult<T> with EquatableMixin {
  T data;
  ApiSuccessResult(this.data);
  
  @override
  List<Object?> get props => [data];
}

class ApiErrorResult<T> extends ApiResult<T> {
  String errorNessage;
  ApiErrorResult(this.errorNessage);
}
