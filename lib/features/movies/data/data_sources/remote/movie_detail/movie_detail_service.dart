import 'package:carnagef_alpha/features/movies/data/models/general_response.dart';
import 'package:carnagef_alpha/features/movies/data/models/movie_detail_model.dart';
import 'package:dio/dio.dart';

abstract class MovieDetailService{

  Future<MovieDetailModel> getMovieDetail({
    int? movieId,
    String? language,
    String? accessTokenAuth
  });

  Future<GeneralResponse> addToWatchlist({
    String? mediaType,
    num? mediaId,
    bool? watchlist,
    String? sessionId,
    String? accessTokenAuth
  });

  Future<GeneralResponse> addToFavorite({
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