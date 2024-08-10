import 'package:carnagef_alpha/core/constants/end_points.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/popular/popular_service.dart';
import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';
import 'package:dio/dio.dart';

class PopularServiceImpl implements PopularService{

  final Dio _dio;
  PopularServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<MoviesResponseModel> getPopularMovies({
    String? language,
    int? page,
    String? accessTokenAuth
  }) async {

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final params = <String, dynamic>{
      'language': language,
      'page': page
    };

    final httpResponse = await _dio.get(
        ApiEndPoints.popularMovies,
        options: Options(headers: headers),
        queryParameters: params
    );

    return MoviesResponseModel.fromJson(httpResponse.data, httpResponse.statusMessage, httpResponse.statusCode);
  }

}