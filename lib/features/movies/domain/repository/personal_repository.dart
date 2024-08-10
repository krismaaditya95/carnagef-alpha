import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';

abstract class PersonalRepository{

  Future<MoviesResponseEntity> getWatchlistMovies({
    String? language,
    int? page,
    String? sessionId,
    String? sortBy,
    String? accessTokenAuth
  });

  Future<MoviesResponseEntity> getFavoriteMovies({
    String? language,
    int? page,
    String? sessionId,
    String? sortBy,
    String? accessTokenAuth
  });
}