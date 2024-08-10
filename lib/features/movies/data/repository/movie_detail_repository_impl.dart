import 'package:carnagef_alpha/features/movies/data/data_sources/remote/movie_detail/movie_detail_service.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/general_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/movie_detail_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/movie_detail_repository.dart';
import 'package:dio/dio.dart';

class MovieDetailRepositoryImpl implements MovieDetailRepository{

  final MovieDetailService _movieDetailService;

  MovieDetailRepositoryImpl({required MovieDetailService movieDetailService})
      : _movieDetailService = movieDetailService;

  @override
  Future<MovieDetailEntity> getMovieDetail({
    int? movieId,
    String? language,
    String? accessTokenAuth
  }) async {

    var response = await _movieDetailService.getMovieDetail(
        movieId: movieId,
        language: language,
        accessTokenAuth: accessTokenAuth
    );

    return MovieDetailResponseMapper.toEntity(response);
  }

  @override
  Future downloadImage({ProgressCallback? progress, String? imageUrl}) async {
    await _movieDetailService.downloadImage(progress: progress, imageUrl: imageUrl);
  }

  @override
  Future<GeneralEntity> addToWatchlist({
    String? mediaType,
    num? mediaId,
    bool? watchlist,
    String? sessionId,
    String? accessTokenAuth}) async {
    var response = await _movieDetailService.addToWatchlist(
      mediaType: mediaType,
      mediaId: mediaId,
      watchlist: watchlist,
      sessionId: sessionId,
      accessTokenAuth: accessTokenAuth
    );

    return GeneralResponseMapper.toEntity(response);
  }

  @override
  Future<GeneralEntity> addToFavorite({
    String? mediaType,
    num? mediaId,
    bool? favorite,
    String? sessionId,
    String? accessTokenAuth}) async {
    var response = await _movieDetailService.addToFavorite(
        mediaType: mediaType,
        mediaId: mediaId,
        favorite: favorite,
        sessionId: sessionId,
        accessTokenAuth: accessTokenAuth
    );

    return GeneralResponseMapper.toEntity(response);
  }
}