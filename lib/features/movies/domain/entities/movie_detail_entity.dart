import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable{

  final bool? success;
  final num? statusCode;
  final String? statusMessage;

  final bool? adult;
  final String? backdropPath;
  final BelongsToCollectionEntity? belongsToCollectionEntity;
  final num? budget;
  final List<GenresEntity>? genresEntity;
  final String? homepage;
  final num? id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompaniesEntity>? productionCompaniesEntity;
  final List<ProductionCountriesEntity>? productionCountriesEntity;
  final String? releaseDate;
  final num? revenue;
  final num? runtime;
  final List<SpokenLanguagesEntity>? spokenLanguagesEntity;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;

  const MovieDetailEntity(
      {
        this.success,
        this.statusCode,
        this.statusMessage,

        this.adult,
        this.backdropPath,
        this.belongsToCollectionEntity,
        this.budget,
        this.genresEntity,
        this.homepage,
        this.id,
        this.imdbId,
        this.originCountry,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompaniesEntity,
        this.productionCountriesEntity,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguagesEntity,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      belongsToCollectionEntity,
      budget,
      genresEntity,
      homepage,
      id,
      imdbId,
      originCountry,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      productionCompaniesEntity,
      productionCountriesEntity,
      releaseDate,
      revenue,
      runtime,
      spokenLanguagesEntity,
      status,
      tagline,
      title,
      video,
      voteAverage,
      voteCount
    ];
  }
}

class BelongsToCollectionEntity extends Equatable{
  final num? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  const BelongsToCollectionEntity({this.id, this.name, this.posterPath, this.backdropPath});

  @override
  List<Object?> get props => [
    id, name, posterPath, backdropPath
  ];
}

class GenresEntity extends Equatable {
  final num? id;
  final String? name;

  const GenresEntity({this.id, this.name});

  @override
  List<Object?> get props => [
    id, name
  ];
}

class ProductionCompaniesEntity extends Equatable {
  final num? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  const ProductionCompaniesEntity({this.id, this.logoPath, this.name, this.originCountry});

  @override
  List<Object?> get props => [
    id, logoPath, name, originCountry
  ];
}

class ProductionCountriesEntity extends Equatable{
  final String? iso31661;
  final String? name;

  const ProductionCountriesEntity({this.iso31661, this.name});

  @override
  List<Object?> get props => [
    iso31661, name
  ];
}

class SpokenLanguagesEntity extends Equatable {
  final String? englishName;
  final String? iso6391;
  final String? name;

  const SpokenLanguagesEntity({this.englishName, this.iso6391, this.name});

  @override
  List<Object?> get props => [
    englishName, iso6391, name
  ];
}