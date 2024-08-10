import 'package:carnagef_alpha/features/movies/data/data_sources/remote/movie_detail/movie_detail_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/movie_detail/movie_detail_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/movie_detail_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/movie_detail_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/movie_detail_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/getx/movie_detail_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MovieDetailBinding extends Bindings{
  @override
  void dependencies() {

    // Bindings untuk movie detail page dipindah ke similar_movie_binding.dart

    // Get.put<MovieDetailService>(
    //     MovieDetailServiceImpl(dio: Get.find<Dio>())
    // );
    //
    // Get.put<MovieDetailRepository>(
    //     MovieDetailRepositoryImpl(movieDetailService: Get.find<MovieDetailService>())
    // );
    //
    // Get.put<MovieDetailUseCase>(
    //     MovieDetailUseCase(
    //       movieDetailRepository: Get.find<MovieDetailRepository>(),
    //     )
    // );
    //
    // // Get.put(MovieDetailController(
    // //     movieDetailUseCase: Get.find<MovieDetailUseCase>()
    // // ));
    //
    // Get.lazyPut(() =>
    //     MovieDetailController(
    //         movieDetailUseCase: Get.find<MovieDetailUseCase>())
    // );
  }
}