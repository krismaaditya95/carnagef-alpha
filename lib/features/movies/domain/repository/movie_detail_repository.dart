import 'package:carnagef_alpha/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:dio/dio.dart';

abstract class MovieDetailRepository{

  Future<MovieDetailEntity> getMovieDetail({
    int? movieId,
    String? language,
    String? accessTokenAuth
  });

  Future downloadImage({
    ProgressCallback? progress,
    String? imageUrl,
  });
}