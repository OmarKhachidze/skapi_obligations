import '../../extension/dio_exception_extension.dart';

abstract class Resource<T> {}

class Loading<T> extends Resource<T> {}

class Success<T> extends Resource<T> {
  Success(this.data);

  final T data;
}

class Error<T> extends Resource<T> {
  Error(this.errorType);

  final SkapiErrorType errorType;
}
