import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:dio/dio.dart';

abstract class MovieDetailRepository{

  Future<MovieDetailEntity> getMovieDetail({
    int? movieId,
    String? language,
    String? accessTokenAuth
  });

  Future<GeneralEntity> addToWatchlist({
    String? mediaType,
    num? mediaId,
    bool? watchlist,
    String? sessionId,
    String? accessTokenAuth
  });

  Future<GeneralEntity> addToFavorite({
    String? mediaType,
    num? mediaId,
    bool? favorite,
    String? sessionId,
    String? accessTokenAuth
  });

  Future downloadImage({
    ProgressCallback? progress,
    String? imageUrl,
  });
}