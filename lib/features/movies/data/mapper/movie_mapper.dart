import 'package:carnagef_alpha/features/movies/data/models/movie_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_entity.dart';

/// MAPPER Class that is used to map DTO / Model Class into Entity class
/// [MovieMapper] is used to map [MovieModel] into [MovieEntity]
/// -----------------------------------------------------------
class MovieMapper {
  static MovieEntity toEntity(MovieModel model) => MovieEntity(
      adult: model.adult,
      backdropPath: model.backdropPath,
      genreIds: model.genreIds,
      id: model.id,
      originalLanguage: model.originalLanguage,
      originalTitle: model.originalTitle,
      overview: model.overview,
      popularity: model.popularity,
      posterPath: model.posterPath,
      releaseDate: model.releaseDate,
      title: model.title,
      video: model.video,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount);
}