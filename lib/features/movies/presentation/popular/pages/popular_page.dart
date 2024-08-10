import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/pages/movie_detail_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/popular/getx/popular_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularPage extends GetView<PopularController> {

  static const String routeName = '/popular-page';
  const PopularPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(controller.title),
          actions: [
            IconButton(onPressed: () {
              controller.getPopularMovies();
            }, icon: const Icon(Icons.refresh))
          ],
        ),

        // ----------Menggunakan StateMixin----------
        body: controller.obx(
                (data) => Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    displacement: 8.0,
                    onRefresh: () async {
                      controller.getPopularMovies();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: AppThemes.cE2E2B6,
                      child: ListView.builder(
                        // itemCount: controller.moviesResponseEntity.results!.length,
                          itemCount: controller.popularMoviesResponseEntity.results!.length <= 20 ?
                          controller.popularMoviesResponseEntity.results!.length : 20,
                          itemBuilder: (context, index){

                            return MovieTile(
                              movieEntity: controller.popularMoviesResponseEntity.results![index],
                              callback: (){
                                Get.to(() => const MovieDetailPage(),
                                    arguments: controller.popularMoviesResponseEntity.results![index].id);
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
