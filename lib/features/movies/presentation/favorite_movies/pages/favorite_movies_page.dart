import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/features/movies/presentation/favorite_movies/getx/favorite_movies_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/pages/movie_detail_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteMoviesPage extends GetView<FavoriteMoviesController> {

  static const String routeName = '/favorite-page';
  const FavoriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(controller.title),
          actions: [
            IconButton(onPressed: () {
              controller.getFavoriteMovies();
            }, icon: const Icon(Icons.refresh))
          ],
        ),

        body: controller.obx(
            (data) => Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    displacement: 8.0,
                    onRefresh: () async {
                      controller.getFavoriteMovies();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: AppThemes.cE2E2B6,
                      child: ListView.builder(
                          // itemCount: controller.moviesResponseEntity.results!.length,
                          itemCount: controller.favoriteMoviesResponseEntity.results!.length,
                          itemBuilder: (context, index){

                            return MovieTile(
                              movieEntity: controller.favoriteMoviesResponseEntity.results![index],
                              callback: (){
                                Get.to(() => const MovieDetailPage(),
                                  arguments: controller.favoriteMoviesResponseEntity.results![index].id);
                              },
                            );
                          }
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onEmpty: const Text("No Data yet"),
            onLoading: const Center(child: CircularProgressIndicator()),
            onError: (error){
              return Text(error.toString());
            }
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
