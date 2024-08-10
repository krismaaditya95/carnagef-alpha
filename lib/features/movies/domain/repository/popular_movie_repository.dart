import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';

abstract class PopularMovieRepository{

  Future<MoviesResponseEntity> getPopularMovies({
    String? language,
    int? page,
    String? accessTokenAuth
  });
}