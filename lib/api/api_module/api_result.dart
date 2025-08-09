sealed class ApiResult<T>{}

class ApiSuccessResult<T> extends ApiResult<T>{
  T data;
  ApiSuccessResult({required this.data});
}

class ApiErrorResult<T> extends ApiResult<T> {
  final String errorMessage;
  final int? errorCode;

  ApiErrorResult({
    required this.errorMessage,
    this.errorCode,
  });
}