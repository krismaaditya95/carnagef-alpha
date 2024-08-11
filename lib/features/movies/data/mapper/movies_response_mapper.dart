import 'package:carnagef_alpha/features/movies/data/mapper/movie_mapper.dart';
import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';

/// MAPPER Class that is used to map DTO / Model Class into Entity class
/// [MoviesResponseMapper] is used to map [MoviesResponseModel] into [MoviesResponseEntity]
/// -----------------------------------------------------------
class MoviesResponseMapper {
  static MoviesResponseEntity toEntity(MoviesResponseModel model) =>
      MoviesResponseEntity(
        statusCode: model.statusCode,
        statusMessage: model.statusMessage,
        dates: model.dates,
        page: model.page,
        results: model.results?.map((e) => MovieMapper.toEntity(e)).toList(),
        totalPages: model.totalPages,
        totalResults: model.totalResults
      );
}