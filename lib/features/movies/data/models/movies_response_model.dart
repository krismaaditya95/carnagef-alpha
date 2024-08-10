import 'package:carnagef_alpha/features/movies/data/models/dates.dart';
import 'package:carnagef_alpha/features/movies/data/models/movie_model.dart';

class MoviesResponseModel{

  String? statusMessage;
  int? statusCode;
  Dates? dates;
  int? page;
  List<MovieModel>? results;
  int? totalPages;
  int? totalResults;

  MoviesResponseModel({
    this.statusMessage,
    this.statusCode,
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MoviesResponseModel.fromJson(Map<String, dynamic> json, String? message, int? code) {
    return MoviesResponseModel(
      statusMessage: message ?? "",
        statusCode: code ?? 0,
        dates: json['dates'] == null ? null : Dates.fromJson(json['dates']),
        page: json['page'] ?? "",
        //     if (json['results'] != null) {
        //   results = <MovieModel>[];
        //   json['results'].forEach((v) {
        //     results!.add(MovieModel.fromJson(v));
        //   });
        // }
        results: json['results'] == null ? [] :
            List<MovieModel>.from(
                json['results'].map((x) => MovieModel.fromJson(x))),

        // results: List<MovieModel>.from(jsonDecode(json['results'])),

        // results: json['results'],

        totalPages: json['total_pages'] ?? 0,
        totalResults: json['total_results'] ?? 0);
  }

  Map<String, dynamic> toJson() => {
    "statusMessage": statusMessage,
    "statusCode": statusCode,
    "dates": dates,
    "page": page,
    "results": results,
    "totalPages": totalPages,
    "total_results": totalResults
  };
}