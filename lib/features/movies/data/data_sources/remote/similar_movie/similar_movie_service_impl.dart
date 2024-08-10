import 'package:carnagef_alpha/core/constants/end_points.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/similar_movie/similar_movie_service.dart';
import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';
import 'package:dio/dio.dart';

class SimilarMovieServiceImpl implements SimilarMovieService{

  final Dio _dio;
  SimilarMovieServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<MoviesResponseModel> getSimilarMovie({
    int? movieId,
    String? language,
    int? page,
    String? accessTokenAuth
  }) async {
    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final String pathParams = movieId.toString();

    final params = <String, dynamic>{
      'language': language,
      'page': page
    };

    final httpResponse = await _dio.get(
        '${ApiEndPoints.similarMovie}/$pathParams/similar',
        options: Options(headers: headers),
        queryParameters: params
    );

    // debugPrint("NOW PLAYING SERVICE LOG = ${jsonEncode(httpResponse.data)}");

    return MoviesResponseModel.fromJson(httpResponse.data, httpResponse.statusMessage, httpResponse.statusCode);
  }



}