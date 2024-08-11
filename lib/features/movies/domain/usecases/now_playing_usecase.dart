import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/now_playing_movie_repository.dart';

/// USECASE Class is used to encapsulate the specific business logic for a given use case
/// Each usecase contains only one specific task
/// Here, [NowPlayingUseCase] interact and coordinate with [NowPlayingMovieRepository],
/// access its function [getNowPLayingMovieList] and retrieve [MoviesResponseEntity]
/// After that, this usecase imported and used in the Controller in the Presentation Layer
/// -----------------------------------------------------------
class NowPlayingUseCase extends BaseUsecase<MoviesResponseEntity, GeneralMoviesParams>{

  final NowPlayingMovieRepository _nowPlayingMovieRepository;

  NowPlayingUseCase({
    required NowPlayingMovieRepository nowPlayingMovieRepository,
  }) : _nowPlayingMovieRepository = nowPlayingMovieRepository;

  @override
  Future<MoviesResponseEntity> call(GeneralMoviesParams params) async {
    return await _nowPlayingMovieRepository.getNowPLayingMovieList(
        language: params.language,
        page: params.page,
        accessTokenAuth: params.accessTokenAuth
    );
  }

}