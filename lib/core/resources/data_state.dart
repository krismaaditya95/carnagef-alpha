import 'package:dio/dio.dart';

/// this work same as [data_wrapper.dart]
/// However , i didn't use / implement this abstract class for this project
/// I just wrote it for different approach, just in case in the future i need it
abstract class DataState<T>{
  final T ? data;
  final DioException ? exception;

  const DataState({this.data, this.exception});
}

class DataSuccess<T> extends DataState<T>{
  const DataSuccess(T? data) : super(data: data);
}

class DataFailed<T> extends DataState<T>{
  const DataFailed(DioException exception) : super(exception: exception);
}