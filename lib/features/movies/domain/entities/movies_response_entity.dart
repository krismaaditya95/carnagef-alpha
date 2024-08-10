import 'package:carnagef_alpha/features/movies/data/models/dates.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_entity.dart';
import 'package:equatable/equatable.dart';

class MoviesResponseEntity extends Equatable{

  final String? statusMessage;
  final int? statusCode;
  final Dates? dates;
  final int? page;
  final List<MovieEntity>? results;
  final int? totalPages;
  final int? totalResults;

  const MoviesResponseEntity(
      {this.statusMessage,
      this.statusCode,
      this.dates,
      this.page,
      this.results,
      this.totalPages,
      this.totalResults});

  @override
  List<Object?> get props {
    return[
      statusMessage,
      statusCode,
      dates,
      page,
      results,
      totalPages,
      totalResults
    ];
  }
}

