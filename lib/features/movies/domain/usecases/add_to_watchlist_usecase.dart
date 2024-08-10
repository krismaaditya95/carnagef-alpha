import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/movie_detail_repository.dart';

class AddToWatchlistUseCase extends BaseUsecase<GeneralEntity, GeneralMoviesParams>{

  final MovieDetailRepository _movieDetailRepository;

  AddToWatchlistUseCase({
    required MovieDetailRepository movieDetailRepository,
  }) : _movieDetailRepository = movieDetailRepository;

  @override
  Future<GeneralEntity> call(GeneralMoviesParams params) async {
    return await _movieDetailRepository.addToWatchlist(
        mediaType: params.mediaType,
        mediaId: params.mediaId,
        watchlist: params.watchlist,
        sessionId: params.sessionId,
        accessTokenAuth: params.accessTokenAuth
    );
  }
}