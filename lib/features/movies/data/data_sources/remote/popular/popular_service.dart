import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';

abstract class PopularService{

  Future<MoviesResponseModel> getPopularMovies({
    String? language,
    int? page,
    String? accessTokenAuth
  });
}