
// abstract class BaseUsecase<Type, Params>{
//   Future<Type> call ({Params params});
// }

import 'package:dio/dio.dart';

abstract class BaseUsecase<Type, Params>{
  // Future<Type> build({Params? params});

  Future<Type> call (Params params);
}

abstract class BaseDownloadUseCase{
  Future download (ProgressCallback progress, dynamic params);
}

class NoParams{
  List<Object> get props => [];
}