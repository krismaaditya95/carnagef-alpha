import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/features/movies/presentation/favorite_movies/getx/favorite_movies_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/pages/movie_detail_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/bordered_button.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/personal_movie_tile.dart';
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 14),
                      child: BorderedButton(
                          icon: Icons.arrow_upward_rounded,
                          text: "Newest",
                          textColor: controller.sortByState.value != 'created_at.desc' ?
                          AppThemes.c03346E : Colors.white,
                          borderColor: controller.sortByState.value != 'created_at.desc' ?
                          AppThemes.c021526 : Colors.white,
                          backgroundColor: controller.sortByState.value != 'created_at.desc' ?
                          Colors.white : AppThemes.c03346E,
                          callback: () async {
                            controller.sortByState.value = 'created_at.desc';
                            await controller.getFavoriteMovies(sortBy: 'created_at.desc');
                          }
                      ),
                    ),

                    Container(
                      margin: const EdgeInsets.all(8),
                      child: BorderedButton(
                          icon: Icons.arrow_downward_rounded,
                          text: "Oldest",
                          textColor: controller.sortByState.value != 'created_at.asc' ?
                          AppThemes.c03346E : Colors.white,
                          borderColor: controller.sortByState.value != 'created_at.asc' ?
                          AppThemes.c021526 : Colors.white,
                          backgroundColor: controller.sortByState.value != 'created_at.asc' ?
                          Colors.white : AppThemes.c03346E,
                          callback: () async {
                            controller.sortByState.value = 'created_at.asc';
                            await controller.getFavoriteMovies(sortBy: 'created_at.asc');
                          }
                      ),
                    )
                  ],
                ),

                Expanded(
                  child: RefreshIndicator(
                    displacement: 8.0,
                    onRefresh: () async {
                      controller.getFavoriteMovies();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: Colors.white38,
                      child: ListView.builder(
                          // itemCount: controller.moviesResponseEntity.results!.length,
                          itemCount: controller.favoriteMoviesResponseEntity.results!.length,
                          itemBuilder: (context, index){

                            return PersonalMovieTile(
                              movieEntity: controller.favoriteMoviesResponseEntity.results![index],
                              callback: (){
                                Get.to(() => const MovieDetailPage(),
                                  arguments: controller.favoriteMoviesResponseEntity.results![index].id);
                              },
                              deleteWidgetState: Obx((){
                                if(controller.isRemoveLoading.value == true){
                                  return Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 14, top: 14, right: 14, bottom: 14),
                                        width: 10,
                                        height: 10,
                                        child: const CircularProgressIndicator(
                                          color: AppThemes.c03346E,
                                          strokeWidth: 2.0,
                                        ),
                                      ),
                                      const Text("removing...", style: TextStyle(color: AppThemes.c021526, fontSize: 10))
                                    ],
                                  );
                                }else{
                                  return BorderedButton(
                                      icon: Icons.delete_forever_sharp,
                                      text: "Remove",
                                      textColor: AppThemes.c03346E,
                                      borderColor: AppThemes.c021526,
                                      callback: () async {
                                        await controller.removeFromFavorite(
                                            mediaId: controller.favoriteMoviesResponseEntity.results![index].id,
                                            mediaTitle: controller.favoriteMoviesResponseEntity.results![index].title.toString()
                                        );
                                      }
                                  );
                                }
                              }),
                            );
                          }
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onEmpty: const Center(child: Text("You don't have movie in your favorite")),
            onLoading: const Center(child: CircularProgressIndicator()),
            onError: (error){
              return Text(error.toString());
            }
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
