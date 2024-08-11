
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/personal/personal_service.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/movies_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/personal_repository.dart';

/// implementation repository class of [PersonalRepository]
/// Communicates with [PersonalService] and perform their member functions
///
class PersonalRepositoryImpl implements PersonalRepository{

  final PersonalService _personalService;

  PersonalRepositoryImpl({required PersonalService personalService})
      : _personalService = personalService;

  @override
  Future<MoviesResponseEntity> getWatchlistMovies({
    String? language,
    int? page,
    String? sessionId,
    String? sortBy,
    String? accessTokenAuth
  }) async {

    var response = await _personalService.getWatchlistMovies(
        language: language,
        page: page,
        sessionId: sessionId,
        sortBy: sortBy,
        accessTokenAuth: accessTokenAuth
    );

    return MoviesResponseMapper.toEntity(response);
  }

  @override
  Future<MoviesResponseEntity> getFavoriteMovies({
    String? language,
    int? page,
    String? sessionId,
    String? sortBy,
    String? accessTokenAuth}) async {

    var response = await _personalService.getFavoriteMovies(
        language: language,
        page: page,
        sessionId: sessionId,
        sortBy: sortBy,
        accessTokenAuth: accessTokenAuth
    );

    return MoviesResponseMapper.toEntity(response);
  }
}