
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/popular/popular_service.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/movies_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/popular_movie_repository.dart';

class PopularMovieRepositoryImpl implements PopularMovieRepository{

  final PopularService _popularService;

  PopularMovieRepositoryImpl({required PopularService popularService})
      : _popularService = popularService;

  @override
  Future<MoviesResponseEntity> getPopularMovies({
    String? language,
    int? page,
    String? accessTokenAuth
  }) async {

    var response = await _popularService.getPopularMovies(
        language: language,
        page: page,
        accessTokenAuth: accessTokenAuth
    );
    return MoviesResponseMapper.toEntity(response);
  }
}