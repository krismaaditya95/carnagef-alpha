import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';

abstract class SimilarMovieRepository{

  Future<MoviesResponseEntity> getSimilarMovie({
    int? movieId,
    String? language,
    int? page,
    String? accessTokenAuth
  });
}