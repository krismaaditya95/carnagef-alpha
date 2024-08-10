
import 'package:carnagef_alpha/features/movies/data/models/base_model.dart';

class MovieDetailModel implements BaseModel{
  bool? adult;
  String? backdropPath;
  BelongsToCollection? belongsToCollection;
  num? budget;
  List<Genres>? genres;
  String? homepage;
  num? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  num? revenue;
  num? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  num? voteAverage;
  num? voteCount;

  @override
  num? statusCode;

  @override
  String? statusMessage;

  @override
  bool? success;

  MovieDetailModel(
      {this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originCountry,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
        this.success,
        this.statusCode,
        this.statusMessage
      });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        success: json['success'],
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        adult: json['adult'] ?? "",
        backdropPath: json['backdrop_path'],
        belongsToCollection: json['belongs_to_collection'] != null
            ? BelongsToCollection.fromJson(json['belongs_to_collection'])
            : BelongsToCollection(),
        budget: json['budget'],

        genres: json['genres'] == null ? [] :
        List<Genres>.from(
            json['genres'].map((x) => Genres.fromJson(x))),

        homepage: json['homepage'],
        id: json['id'],
        imdbId: json['imdb_id'],
        originCountry: json['origin_country'].cast<String>(),
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],

        productionCompanies: json['production_companies'] == null ? [] :
        List<ProductionCompanies>.from(
            json['production_companies'].map((x) => ProductionCompanies.fromJson(x))),

        productionCountries: json['production_countries'] == null ? [] :
        List<ProductionCountries>.from(
            json['production_countries'].map((x) => ProductionCountries.fromJson(x))),

        releaseDate: json['release_date'],
        revenue: json['revenue'],
        runtime: json['runtime'],

        spokenLanguages: json['spoken_languages'] == null ? [] :
        List<SpokenLanguages>.from(
            json['spoken_languages'].map((x) => SpokenLanguages.fromJson(x))),

        status: json['status'],
        tagline: json['tagline'],
        title: json['title'],
        video: json['video'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count'],
      );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "belongs_to_collection": belongsToCollection,
    "budget": budget,
    "genres": genres,
    "homepage": homepage,
    "id": id,
    "imdb_id": imdbId,
    "origin_country": originCountry,
    "original_language": originalLanguage,
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "production_companies": productionCompanies,
    "production_countries": productionCountries,
    "release_date": releaseDate,
    "revenue": revenue,
    "runtime": runtime,
    "spoken_languages": spokenLanguages,
    "status": status,
    "tagline": tagline,
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

class BelongsToCollection {
  num? id;
  String? name;
  String? posterPath;
  String? backdropPath;

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      BelongsToCollection(
        id: json['id'] ?? "",
        name: json['name'] ?? "",
        posterPath: json['poster_path'] ?? "",
        backdropPath: json['backdrop_path'] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "posterPath": posterPath,
    "backdropPath": backdropPath
  };
}

class Genres {
  num? id;
  String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) =>
      Genres(
          id: json['id'] ?? "",
          name: json['name'] ?? ""
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name
  };
}

class ProductionCompanies {
  num? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> json) =>
      ProductionCompanies(
          id: json['id'] ?? "",
          logoPath: json['logo_path'] ?? "",
          name: json['name'] ?? "",
          originCountry: json['origin_country'] ?? ""
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo_path": logoPath,
    "name": name,
    "origin_country":originCountry
  };
}

class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      ProductionCountries(
          iso31661: json['iso_3166_1'] ?? "",
          name: json['name'] ?? ""
      );

  Map<String, dynamic> toJson() => {
    "iso_3166_1": iso31661,
    "name": name
  };
}

class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) =>
      SpokenLanguages(
        englishName: json['english_name'] ?? "",
        iso6391:json['iso_639_1'] ?? "",
        name:json['name'] ?? "",
      );

  Map<String, dynamic> toJson() => {
    "english_name": englishName,
    "iso_639_1": iso6391,
    "name": name
  };
}