import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/now_playing_movie_repository.dart';

// class NowPlayingUseCase implements BaseUsecase<DataState<MoviesResponseEntity>, void>{
//   final NowPlayingMovieRepository _nowPlayingMovieRepository;
//
//   NowPlayingUseCase({required NowPlayingMovieRepository nowPlayingMovieRepository})
//       : _nowPlayingMovieRepository = nowPlayingMovieRepository;
//
//   @override
//   Future<DataState<MoviesResponseEntity>> call({void params}) {
//     return _nowPlayingMovieRepository.getNowPLayingMovieList();
//   }
//
// }

class NowPlayingUseCase extends BaseUsecase<MoviesResponseEntity, GeneralMoviesParams>{

  final NowPlayingMovieRepository _nowPlayingMovieRepository;

  NowPlayingUseCase({
    required NowPlayingMovieRepository nowPlayingMovieRepository,
  }) : _nowPlayingMovieRepository = nowPlayingMovieRepository;

  @override
  Future<MoviesResponseEntity> call(GeneralMoviesParams params) async {
    return await _nowPlayingMovieRepository.getNowPLayingMovieList(
        language: params.language,
        page: params.page,
        accessTokenAuth: params.accessTokenAuth
    );
  }

}