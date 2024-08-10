import 'package:carnagef_alpha/features/movies/presentation/similar_movies/getx/similar_movie_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimilarMoviePage extends GetView<SimilarMovieController> {

  static const String routeName = '/similar-movie-page';
  final int? movieId;
  final Function(int? movieId) callback;
  const SimilarMoviePage({super.key, this.movieId, required this.callback});

  @override
  Widget build(BuildContext context) {

    controller.getSimilarMovies(movieId:movieId);

    return controller.obx(
      (data) => Column(
        children: controller.moviesResponseEntity.results!
          .map((item) => MovieTile(
          movieEntity: item,
          callback: () => callback(item.id),
          // {
            // Get.to(() => const MovieDetailPage(),
            //     arguments: item.id);

          // },
        )).toList().sublist(0, 20)),
        onEmpty: const Text("No Data yet"),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) {
      return Text(error.toString());
    });
  }
}
