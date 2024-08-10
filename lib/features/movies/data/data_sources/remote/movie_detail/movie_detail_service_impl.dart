import 'dart:io';
import 'package:carnagef_alpha/core/constants/end_points.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/movie_detail/movie_detail_service.dart';
import 'package:carnagef_alpha/features/movies/data/models/general_response.dart';
import 'package:carnagef_alpha/features/movies/data/models/movie_detail_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class MovieDetailServiceImpl implements MovieDetailService{

  final Dio _dio;
  MovieDetailServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<MovieDetailModel> getMovieDetail({
    int? movieId,
    String? language,
    String? accessTokenAuth
  }) async {

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final String pathParams = movieId.toString();

    final params = <String, dynamic>{
      'language': language,
    };

    // try{
    final httpResponse = await _dio.get(
        '${ApiEndPoints.movieDetails}/$pathParams',
        options: Options(headers: headers),
        queryParameters: params
    );

    // debugPrint("NOW PLAYING SERVICE LOG = ${jsonEncode(httpResponse.data)}");

    return MovieDetailModel.fromJson(httpResponse.data);
    // } on DioException catch (e){
    //   //catch exception di sini
    //   rethrow;
    // }
  }

  @override
  Future downloadImage({ProgressCallback? progress, String? imageUrl}) async {

    // final Directory? downloadDirectory = await getDownloadsDirectory();
    final Directory downloadDirectory = Directory('/storage/emulated/0/Download');
    final String fullPath = downloadDirectory.path;

    debugPrint("IMAGE DOWNLOAD SERVICE | Download path => $fullPath");

    // await _dio.download(
    //     'https://image.tmdb.org/t/p/original$imageUrl',
    //     fullPath + imageUrl.toString(),
    //     onReceiveProgress: (received, total) {
    //       if (total <= 0) return;
    //       debugPrint('download image progress : ${(received / total * 100).toStringAsFixed(0)}%');
    //     },
    //     deleteOnError: true
    // );

    await _dio.download(
        'https://image.tmdb.org/t/p/original$imageUrl',
        fullPath + imageUrl.toString(),
        onReceiveProgress: progress,
        deleteOnError: true
    );

  }

  @override
  Future<GeneralResponse> addToWatchlist({
    String? mediaType,
    num? mediaId,
    bool? watchlist,
    String? sessionId,
    String? accessTokenAuth}) async {

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final params = <String, dynamic>{
      'session_id': sessionId
    };

    final httpResponse = await _dio.post(
        ApiEndPoints.addToWatchlist,
        options: Options(headers: headers),
        queryParameters: params,
        data: {
          "media_type": mediaType,
          "media_id": mediaId,
          "watchlist": watchlist,
        }
    );

    return GeneralResponse.fromJson(httpResponse.data);
  }

  @override
  Future<GeneralResponse> addToFavorite({
    String? mediaType,
    num? mediaId,
    bool? favorite,
    String? sessionId,
    String? accessTokenAuth}) async {

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final params = <String, dynamic>{
      'session_id': sessionId
    };

    final httpResponse = await _dio.post(
        ApiEndPoints.addToFavorite,
        options: Options(headers: headers),
        queryParameters: params,
        data: {
          "media_type": mediaType,
          "media_id": mediaId,
          "favorite": favorite,
        }
    );

    return GeneralResponse.fromJson(httpResponse.data);
  }

}