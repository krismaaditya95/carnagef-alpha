import 'package:carnagef_alpha/core/constants/end_points.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/now_playing/now_playing_service.dart';
import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';
import 'package:dio/dio.dart';

/// implementation data source class of [NowPLayingService]
/// we perform all http request related to Now Playing Movies API explained in TMDB API documentation
///
/// [getNowPLayingMovieList] => get now playing movies
///
class NowPlayingServiceImpl implements NowPLayingService{

  final Dio _dio;
  NowPlayingServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<MoviesResponseModel> getNowPLayingMovieList({
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

    // try{
      final httpResponse = await _dio.get(
          ApiEndPoints.nowPlaying,
          options: Options(headers: headers),
          queryParameters: params
      );

      // debugPrint("NOW PLAYING SERVICE LOG = ${jsonEncode(httpResponse.data)}");

      return MoviesResponseModel.fromJson(httpResponse.data, httpResponse.statusMessage, httpResponse.statusCode);
    // } on DioException catch (e){
    //   //catch exception di sini
    //   rethrow;
    // }
  }

}