import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/movie_detail_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/movie_detail_repository.dart';

class MovieDetailUseCase extends BaseUsecase<MovieDetailEntity, MovieDetailParams>{

  final MovieDetailRepository _movieDetailRepository;

  MovieDetailUseCase({
    required MovieDetailRepository movieDetailRepository,
  }) : _movieDetailRepository = movieDetailRepository;

  @override
  Future<MovieDetailEntity> call(MovieDetailParams params) async {
    return await _movieDetailRepository.getMovieDetail(
        movieId: params.movieId,
        language: params.language,
        accessTokenAuth: params.accessTokenAuth
    );
  }

}