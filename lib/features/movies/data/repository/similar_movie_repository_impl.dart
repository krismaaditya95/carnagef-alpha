import 'package:carnagef_alpha/features/movies/data/data_sources/remote/similar_movie/similar_movie_service.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/movies_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/similar_movie_repository.dart';

class SimilarMovieRepositoryImpl implements SimilarMovieRepository{

  final SimilarMovieService _similarMovieService;

  SimilarMovieRepositoryImpl({required SimilarMovieService similarMovieService})
      : _similarMovieService = similarMovieService;

  @override
  Future<MoviesResponseEntity> getSimilarMovie({
    int? movieId,
    String? language,
    int? page,
    String? accessTokenAuth
  }) async {
    // try{
      var response = await _similarMovieService.getSimilarMovie(
          movieId: movieId,
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