import 'package:carnagef_alpha/features/movies/data/data_sources/remote/now_playing/now_playing_service.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/movies_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/now_playing_movie_repository.dart';

/// implementation repository class of [NowPlayingMovieRepository]
/// Communicates with [NowPLayingService] and perform their member functions
///
class NowPlayingMovieRepositoryImpl implements NowPlayingMovieRepository{

  final NowPLayingService _nowPLayingService;

  NowPlayingMovieRepositoryImpl({required NowPLayingService nowPLayingService})
      : _nowPLayingService = nowPLayingService;

  @override
  Future<MoviesResponseEntity> getNowPLayingMovieList({
    String? language,
    int? page,
    String? accessTokenAuth
  }) async {
    // try{
      var response = await _nowPLayingService.getNowPLayingMovieList(
          language: language,
          page: page,
          accessTokenAuth: accessTokenAuth
      );

      // debugPrint("NOW PLAYING REPOSITORY LOG = ${jsonEncode(response)}");
      // debugPrint("NOW PLAYING REPOSITORY LOG = ${response.totalResults}");

      return MoviesResponseMapper.toEntity(response);
    // } on DioException catch (e){
    //   // return DataFailed(e);
    //   rethrow;
    // }

  }
}