import 'package:carnagef_alpha/core/constants/end_points.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/personal/personal_service.dart';
import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';
import 'package:dio/dio.dart';

/// implementation data source class of [PersonalService]
/// we perform all http request related to User's personal movies
/// such ass Watchlist and Favorite that explained in TMDB API documentation
///
/// [getWatchlistMovies] => get user's watchlist movies
/// [getFavoriteMovies] => get user's favorite movies
///
class PersonalServiceImpl implements PersonalService{

  final Dio _dio;
  PersonalServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<MoviesResponseModel> getWatchlistMovies({
    String? language,
    int? page,
    String? sessionId,
    String? sortBy,
    String? accessTokenAuth
  }) async {

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final params = <String, dynamic>{
      'language': language,
      'page': page,
      'session_id': sessionId,
      'sort_by': sortBy
    };

    final httpResponse = await _dio.get(
        ApiEndPoints.watchlistMovies,
        options: Options(headers: headers),
        queryParameters: params
    );

    return MoviesResponseModel.fromJson(httpResponse.data, httpResponse.statusMessage, httpResponse.statusCode);
  }

  @override
  Future<MoviesResponseModel> getFavoriteMovies({
    String? language,
    int? page,
    String? sessionId,
    String? sortBy,
    String? accessTokenAuth
  }) async {
    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final params = <String, dynamic>{
      'language': language,
      'page': page,
      'session_id': sessionId,
      'sort_by': sortBy
    };

    final httpResponse = await _dio.get(
        ApiEndPoints.favoriteMovies,
        options: Options(headers: headers),
        queryParameters: params
    );

    return MoviesResponseModel.fromJson(httpResponse.data, httpResponse.statusMessage, httpResponse.statusCode);
  }

}