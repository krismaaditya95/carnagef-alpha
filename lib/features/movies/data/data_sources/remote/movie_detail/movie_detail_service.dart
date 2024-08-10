import 'dart:io';
import 'package:carnagef_alpha/features/movies/data/models/movie_detail_model.dart';
import 'package:dio/dio.dart';

abstract class MovieDetailService{

  Future<MovieDetailModel> getMovieDetail({
    int? movieId,
    String? language,
    String? accessTokenAuth
  });

  Future downloadImage({
    ProgressCallback? progress,
    String? imageUrl,
  });
}