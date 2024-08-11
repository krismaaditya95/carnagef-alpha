import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/personal_repository.dart';

/// USECASE Class is used to encapsulate the specific business logic for a given use case
/// Each usecase contains only one specific task
/// Here, [WatchlistMoviesUseCase] interact and coordinate with [PersonalRepository],
/// access its function [getWatchlistMovies] and retrieve [MoviesResponseEntity]
/// After that, this usecase imported and used in the Controller in the Presentation Layer
/// -----------------------------------------------------------
class WatchlistMoviesUseCase extends BaseUsecase<MoviesResponseEntity, GeneralMoviesParams>{

  final PersonalRepository _personalRepository;

  WatchlistMoviesUseCase({
    required PersonalRepository personalRepository,
  }) : _personalRepository = personalRepository;

  @override
  Future<MoviesResponseEntity> call(GeneralMoviesParams params) async {
    return await _personalRepository.getWatchlistMovies(
        language: params.language,
        page: params.page,
        sessionId: params.sessionId,
        sortBy: params.sortBy,
        accessTokenAuth: params.accessTokenAuth
    );
  }
}