import 'package:carnagef_alpha/features/movies/data/data_sources/remote/popular/popular_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/popular/popular_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/popular_movie_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/popular_movie_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/popular_movie_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/popular/getx/popular_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PopularBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<PopularService>(
        PopularServiceImpl(dio: Get.find<Dio>())
    );

    Get.put<PopularMovieRepository>(
        PopularMovieRepositoryImpl(popularService: Get.find<PopularService>())
    );

    Get.put<PopularMovieUseCase>(
        PopularMovieUseCase(
          popularMovieRepository: Get.find<PopularMovieRepository>(),
        )
    );

    Get.put(PopularController(
        popularMovieUseCase: Get.find<PopularMovieUseCase>()
    ));
  }
}