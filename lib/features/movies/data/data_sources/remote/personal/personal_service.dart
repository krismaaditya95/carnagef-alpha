import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';

abstract class PersonalService{

  Future<MoviesResponseModel> getWatchlistMovies({
    String? language,
    int? page,
    String? sessionId,
    String? sortBy,
    String? accessTokenAuth
  });

  Future<MoviesResponseModel> getFavoriteMovies({
    String? language,
    int? page,
    String? sessionId,
    String? sortBy,
    String? accessTokenAuth
  });
}