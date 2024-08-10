import 'package:carnagef_alpha/core/resources/data_state.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';

abstract class NowPlayingMovieRepository{

  Future<MoviesResponseEntity> getNowPLayingMovieList({
    String? language,
    int? page,
    String? accessTokenAuth
  });
}