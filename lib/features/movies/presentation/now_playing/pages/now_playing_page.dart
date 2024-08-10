import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/pages/movie_detail_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/now_playing/getx/now_playing_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/movie_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NowPlayingPage extends GetView<NowPlayingController> {

  static const String routeName = '/now-playing-page';
  const NowPlayingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(controller.title),
          actions: [
            IconButton(onPressed: () {
              controller.getNowPlayingMovies();
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
                      controller.getNowPlayingMovies();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: AppThemes.cE2E2B6,
                      child: ListView.builder(
                          // itemCount: controller.moviesResponseEntity.results!.length,
                          itemCount: 6,
                          itemBuilder: (context, index){

                            return MovieTile(
                              movieEntity: controller.moviesResponseEntity.results![index],
                              callback: (){
                                Get.to(() => MovieDetailPage(),
                                  arguments: controller.moviesResponseEntity.results![index].id);
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
