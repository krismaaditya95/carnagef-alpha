import 'package:carnagef_alpha/features/movies/data/models/movie_detail_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_detail_entity.dart';

/// MAPPER Class that is used to map DTO / Model Class into Entity class
/// [MovieDetailResponseMapper] is used to map [MovieDetailModel] into [MovieDetailEntity]
/// -----------------------------------------------------------
class MovieDetailResponseMapper {
  static MovieDetailEntity toEntity(MovieDetailModel model) =>
      MovieDetailEntity(
        adult: model.adult,
        backdropPath: model.backdropPath,
        belongsToCollectionEntity: BelongsToCollectionMapper.toEntity(model.belongsToCollection),
        budget: model.budget,
        genresEntity: model.genres?.map((e) => GenresMapper.toEntity(e)).toList(),
        homepage: model.homepage,
        id: model.id,
        imdbId: model.imdbId,
        originCountry: model.originCountry,
        originalLanguage: model.originalLanguage,
        originalTitle: model.originalTitle,
        overview: model.overview,
        popularity: model.popularity,
        posterPath: model.posterPath,
        productionCompaniesEntity: model.productionCompanies?.map((e) => ProductionCompaniesMapper.toEntity(e)).toList(),
        productionCountriesEntity: model.productionCountries?.map((e) => ProductionCountriesMapper.toEntity(e)).toList(),
        releaseDate: model.releaseDate,
        revenue: model.revenue,
        runtime: model.runtime,
        spokenLanguagesEntity: model.spokenLanguages?.map((e) => SpokenLanguagesMapper.toEntity(e)).toList(),
        status: model.status,
        tagline: model.tagline,
        title: model.title,
        video: model.video,
        voteAverage: model.voteAverage,
        voteCount: model.voteCount
      );
}

class BelongsToCollectionMapper{
  static BelongsToCollectionEntity toEntity(BelongsToCollection? model) =>
      BelongsToCollectionEntity(
        id: model!.id,
        name: model.name,
        posterPath: model.posterPath,
        backdropPath: model.backdropPath
      );
}

class GenresMapper{
  static GenresEntity toEntity(Genres? model) =>
      GenresEntity(
          id: model!.id,
          name: model.name,
      );
}

class ProductionCompaniesMapper{
  static ProductionCompaniesEntity toEntity(ProductionCompanies? model) =>
      ProductionCompaniesEntity(
          id: model!.id,
          name: model.name,
          logoPath: model.logoPath,
          originCountry: model.originCountry
      );
}

class ProductionCountriesMapper{
  static ProductionCountriesEntity toEntity(ProductionCountries? model) =>
      ProductionCountriesEntity(
        iso31661: model!.iso31661,
        name: model.name
      );
}


class SpokenLanguagesMapper{
  static SpokenLanguagesEntity toEntity(SpokenLanguages? model) =>
      SpokenLanguagesEntity(
          englishName: model!.englishName,
          iso6391: model.iso6391,
        name: model.name
      );
}