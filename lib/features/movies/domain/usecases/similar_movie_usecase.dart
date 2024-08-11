import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/similar_movie_repository.dart';

/// USECASE Class is used to encapsulate the specific business logic for a given use case
/// Each usecase contains only one specific task
/// Here, [SimilarMovieUseCase] interact and coordinate with [SimilarMovieRepository],
/// access its function [getSimilarMovie] and retrieve [MoviesResponseEntity]
/// After that, this usecase imported and used in the Controller in the Presentation Layer
/// -----------------------------------------------------------
class SimilarMovieUseCase extends BaseUsecase<MoviesResponseEntity, GeneralMoviesParams>{

  final SimilarMovieRepository _similarMovieRepository;

  SimilarMovieUseCase({
    required SimilarMovieRepository similarMovieRepository,
  }) : _similarMovieRepository = similarMovieRepository;

  @override
  Future<MoviesResponseEntity> call(GeneralMoviesParams params) async {
    return await _similarMovieRepository.getSimilarMovie(
        movieId: params.movieId,
        language: params.language,
        page: params.page,
        accessTokenAuth: params.accessTokenAuth
    );
  }

}