import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';
import 'package:dio/dio.dart';

abstract class NowPLayingService{

  Future<MoviesResponseModel> getNowPLayingMovieList({
    String? language,
    int? page,
    String? accessTokenAuth
  });
}