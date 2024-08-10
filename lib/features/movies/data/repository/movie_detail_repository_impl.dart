import 'package:carnagef_alpha/features/movies/data/data_sources/remote/movie_detail/movie_detail_service.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/movie_detail_response_mapper.dart';
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
    // try{
      var response = await _movieDetailService.getMovieDetail(
          movieId: movieId,
          language: language,
          accessTokenAuth: accessTokenAuth
      );

      // debugPrint("NOW PLAYING REPOSITORY LOG = ${jsonEncode(response)}");
      // debugPrint("NOW PLAYING REPOSITORY LOG = ${response.totalResults}");

      return MovieDetailResponseMapper.toEntity(response);
    // } on DioException catch (e){
    //   // return DataFailed(e);
    //   rethrow;
    // }

  }

  @override
  Future downloadImage({ProgressCallback? progress, String? imageUrl}) async {
    await _movieDetailService.downloadImage(progress: progress, imageUrl: imageUrl);
  }
}