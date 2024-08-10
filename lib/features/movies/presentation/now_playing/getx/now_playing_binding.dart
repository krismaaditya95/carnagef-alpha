import 'package:carnagef_alpha/features/movies/data/data_sources/remote/movie_detail/movie_detail_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/movie_detail/movie_detail_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/now_playing/now_playing_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/now_playing/now_playing_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/similar_movie/similar_movie_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/similar_movie/similar_movie_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/movie_detail_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/now_playing_movie_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/similar_movie_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/movie_detail_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/now_playing_movie_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/similar_movie_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/download_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/movie_detail_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/now_playing_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/similar_movie_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/getx/movie_detail_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/now_playing/getx/now_playing_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/similar_movies/getx/similar_movie_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class NowPlayingBinding extends Bindings{
  @override
  void dependencies() {

    // Get.put(NowPlayingServiceImpl(dio: Get.find<Dio>()));

    // Get.put(ErrorHandler());

    Get.put<NowPLayingService>(
        NowPlayingServiceImpl(dio: Get.find<Dio>())
    );

    Get.put<NowPlayingMovieRepository>(
        NowPlayingMovieRepositoryImpl(nowPLayingService: Get.find<NowPLayingService>())
    );

    Get.put<NowPlayingUseCase>(
        NowPlayingUseCase(
          nowPlayingMovieRepository: Get.find<NowPlayingMovieRepository>(),
          // errorHandler: Get.find<ErrorHandler>()
        )
    );

    Get.put(NowPlayingController(
        nowPlayingUseCase: Get.find<NowPlayingUseCase>()
    ));

    // Bindings for movie details ============
    Get.put<MovieDetailService>(
        MovieDetailServiceImpl(dio: Get.find<Dio>())
    );

    Get.put<MovieDetailRepository>(
        MovieDetailRepositoryImpl(movieDetailService: Get.find<MovieDetailService>())
    );

    Get.put<MovieDetailUseCase>(
        MovieDetailUseCase(
          movieDetailRepository: Get.find<MovieDetailRepository>(),
        )
    );

    Get.put<DownloadUseCase>(
        DownloadUseCase(
          movieDetailRepository: Get.find<MovieDetailRepository>(),
        )
    );

    Get.put(MovieDetailController(
        movieDetailUseCase: Get.find<MovieDetailUseCase>(),
        downloadUseCase: Get.find<DownloadUseCase>()
    ));

    // Bindings for similar movies ============
    Get.put<SimilarMovieService>(
        SimilarMovieServiceImpl(dio: Get.find<Dio>())
    );

    Get.put<SimilarMovieRepository>(
        SimilarMovieRepositoryImpl(similarMovieService: Get.find<SimilarMovieService>())
    );

    Get.put<SimilarMovieUseCase>(
        SimilarMovieUseCase(
          similarMovieRepository: Get.find<SimilarMovieRepository>(),
        )
    );

    Get.put(SimilarMovieController(
        similarMovieUseCase: Get.find<SimilarMovieUseCase>()
    ));

    // Get.lazyPut(() =>
    //     MovieDetailController(
    //         movieDetailUseCase: Get.find<MovieDetailUseCase>())
    // );
  }
}