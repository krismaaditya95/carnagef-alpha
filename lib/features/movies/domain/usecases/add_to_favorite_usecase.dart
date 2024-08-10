import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/movie_detail_repository.dart';

class AddToFavoriteUseCase extends BaseUsecase<GeneralEntity, GeneralMoviesParams>{

  final MovieDetailRepository _movieDetailRepository;

  AddToFavoriteUseCase({
    required MovieDetailRepository movieDetailRepository,
  }) : _movieDetailRepository = movieDetailRepository;

  @override
  Future<GeneralEntity> call(GeneralMoviesParams params) async {
    return await _movieDetailRepository.addToFavorite(
        mediaType: params.mediaType,
        mediaId: params.mediaId,
        favorite: params.favorite,
        sessionId: params.sessionId,
        accessTokenAuth: params.accessTokenAuth
    );
  }
}