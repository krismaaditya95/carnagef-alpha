import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/personal_repository.dart';

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