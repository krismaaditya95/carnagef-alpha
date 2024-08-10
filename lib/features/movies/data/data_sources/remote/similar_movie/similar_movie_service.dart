import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';

abstract class SimilarMovieService{

  Future<MoviesResponseModel> getSimilarMovie({
    int? movieId,
    String? language,
    int? page,
    String? accessTokenAuth
  });
}