import 'package:dio/dio.dart';

/// Base Usecase abstract class
/// This will be used for implements all usecases in [domain/usecases]
abstract class BaseUsecase<Type, Params>{
  Future<Type> call (Params params);
}

/// Base Usecase abstract class for Downloading Files
abstract class BaseDownloadUseCase{
  Future download (ProgressCallback progress, dynamic params);
}

/// use NoParams if we dont need params in our usecase
class NoParams{
  List<Object> get props => [];
}