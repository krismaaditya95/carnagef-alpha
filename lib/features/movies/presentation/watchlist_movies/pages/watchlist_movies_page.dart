import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/pages/movie_detail_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/watchlist_movies/getx/watchlist_movies_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class WatchlistMoviesPage extends GetView<WatchlistMoviesController> {

  static const String routeName = '/watchlist-page';
  const WatchlistMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(controller.title),
          actions: [
            IconButton(onPressed: () {
              controller.getWatchlistMovies();
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
                      controller.getWatchlistMovies();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: AppThemes.cE2E2B6,
                      child: ListView.builder(
                          // itemCount: controller.moviesResponseEntity.results!.length,
                          itemCount: controller.watchlistMoviesResponseEntity.results!.length,
                          itemBuilder: (context, index){

                            return MovieTile(
                              movieEntity: controller.watchlistMoviesResponseEntity.results![index],
                              callback: (){
                                Get.to(() => const MovieDetailPage(),
                                  arguments: controller.watchlistMoviesResponseEntity.results![index].id);
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
