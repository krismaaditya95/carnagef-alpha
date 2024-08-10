import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/popular_movie_repository.dart';

class PopularMovieUseCase extends BaseUsecase<MoviesResponseEntity, GeneralMoviesParams>{

  final PopularMovieRepository _popularMovieRepository;

  PopularMovieUseCase({
    required PopularMovieRepository popularMovieRepository,
  }) : _popularMovieRepository = popularMovieRepository;

  @override
  Future<MoviesResponseEntity> call(GeneralMoviesParams params) async {
    return await _popularMovieRepository.getPopularMovies(
        language: params.language,
        page: params.page,
        accessTokenAuth: params.accessTokenAuth
    );
  }

}