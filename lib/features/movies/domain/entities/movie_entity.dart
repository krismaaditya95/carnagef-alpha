import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String ? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieEntity(
      {this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  @override
  List<Object?> get props {
    return [
      adult,
      backdropPath,
      genreIds,
      id,
      originalLanguage,
      originalTitle,
      overview,
      popularity,
      posterPath,
      releaseDate,
      title,
      video,
      voteAverage,
      voteCount
    ];
  }

  // MovieEntity.fromJson(Map<String, dynamic> json) {
  //   adult = json['adult'];
  //   backdropPath = json['backdrop_path'];
  //   genreIds = json['genre_ids'].cast<int>();
  //   id = json['id'];
  //   originalLanguage = json['original_language'];
  //   originalTitle = json['original_title'];
  //   overview = json['overview'];
  //   popularity = json['popularity'];
  //   posterPath = json['poster_path'];
  //   releaseDate = json['release_date'];
  //   title = json['title'];
  //   video = json['video'];
  //   voteAverage = json['vote_average'];
  //   voteCount = json['vote_count'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['adult'] = this.adult;
  //   data['backdrop_path'] = this.backdropPath;
  //   data['genre_ids'] = this.genreIds;
  //   data['id'] = this.id;
  //   data['original_language'] = this.originalLanguage;
  //   data['original_title'] = this.originalTitle;
  //   data['overview'] = this.overview;
  //   data['popularity'] = this.popularity;
  //   data['poster_path'] = this.posterPath;
  //   data['release_date'] = this.releaseDate;
  //   data['title'] = this.title;
  //   data['video'] = this.video;
  //   data['vote_average'] = this.voteAverage;
  //   data['vote_count'] = this.voteCount;
  //   return data;
  // }
}