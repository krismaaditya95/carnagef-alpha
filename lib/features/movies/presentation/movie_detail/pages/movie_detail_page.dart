import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/getx/movie_detail_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/similar_movies/pages/similar_movie_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/bordered_button.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/vote_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends GetView<MovieDetailController> {

  static const String routeName = '/movie-detail-page';
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    controller.getMovieDetail(movieId: Get.arguments);

    return Scaffold(
      appBar: AppBar(
        // title: Text("${controller.title}${Get.arguments}"),
        title: Obx(() => Text("${controller.movieDetailEntity.title}")),
      ),
      body: controller.obx(
          (data) => Column(
            children: [
              Expanded(
                  child: RefreshIndicator(
                    displacement: 8.0,
                    onRefresh: () async {
                      controller.getMovieDetail();
                    },
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/original/${controller
                                    .movieDetailEntity.posterPath}',
                              ),
                              fit: BoxFit.cover,
                              colorFilter: const ColorFilter.mode(
                                  Colors.black87,
                                  BlendMode.darken
                              ),
                              // opacity: 0.1
                          )
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10, top: 10),
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: 'https://image.tmdb.org/t/p/original/${controller.movieDetailEntity.posterPath}',
                                        width: 180,
                                      ),

                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        margin: const EdgeInsets.only(right: 2, bottom: 2),
                                        decoration: const BoxDecoration(
                                          color: AppThemes.c03346E,
                                          borderRadius: BorderRadius.all(Radius.circular(6)),
                                        ),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                controller.downloadImage(
                                                    imageUrl: controller.movieDetailEntity.posterPath
                                                );
                                              },
                                              icon: const Icon(Icons.download_for_offline_sharp),
                                              color: Colors.white,
                                            ),

                                            Container(
                                              margin: const EdgeInsets.only(bottom: 2),
                                              child: const Text('Download\nImage',
                                                  style: TextStyle(color: AppThemes.cE2E2B6, fontSize: 8, fontWeight: FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]
                                  ),
                                ),

                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,top: 10, right: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(bottom: 4),
                                          child: Text(controller.movieDetailEntity.title.toString(),
                                              style: const TextStyle(
                                                  color: Colors.white, fontSize: 20
                                              )),
                                        ),

                                        Container(
                                            margin: const EdgeInsets.only(bottom: 4),
                                            child: Text(controller.movieDetailEntity.releaseDate.toString(),
                                                style: const TextStyle(color: Colors.white)
                                            )
                                        ),

                                        Container(
                                          margin: const EdgeInsets.only(bottom: 4),
                                          child: VotePointWidget(
                                            votePoint: controller.movieDetailEntity.voteAverage!.roundToDouble().toString(),
                                            voteCount: controller.movieDetailEntity.voteCount.toString(),
                                          ),
                                        ),

                                        // ADD TO WATCHLIST BUTTON
                                        Obx((){
                                          if(controller.isWatchlistLoading.value == true){
                                            return Container(
                                              margin: const EdgeInsets.only(left: 14, top: 20, right: 14, bottom: 14),
                                              width: 20,
                                              height: 20,
                                              child: const CircularProgressIndicator(
                                                color: AppThemes.c6EACDA,
                                                strokeWidth: 2.0,
                                              ),
                                            );
                                          }else{
                                            return BorderedButton(
                                              icon: Icons.watch_later,
                                              text: "Add to My Watchlist",
                                              callback: () async {
                                                // Get.snackbar('Success', 'Your movie saved to watchlist',
                                                //     snackPosition: SnackPosition.BOTTOM,
                                                //     duration: const Duration(seconds: 3),
                                                //     colorText: Colors.white
                                                // );
                                                await controller.addToWatchlist(
                                                    mediaId: controller.movieDetailEntity.id,
                                                  mediaTitle: controller.movieDetailEntity.title
                                                );
                                              },
                                            );
                                          }
                                        }),

                                        // ADD TO FAVORITE BUTTON
                                        Obx((){
                                          if(controller.isFavoriteLoading.value == true){
                                            return Container(
                                              margin: const EdgeInsets.only(left: 14, top: 20, right: 14, bottom: 14),
                                              width: 20,
                                              height: 20,
                                              child: const CircularProgressIndicator(
                                                color: AppThemes.c6EACDA,
                                                strokeWidth: 2.0,
                                              ),
                                            );
                                          }else{
                                            return BorderedButton(
                                              icon: Icons.favorite_border_sharp,
                                              text: "Add to My Favorite",
                                              callback: () async {
                                                await controller.addToFavorite(
                                                    mediaId: controller.movieDetailEntity.id,
                                                  mediaTitle: controller.movieDetailEntity.title
                                                );
                                              },
                                            );
                                          }
                                        }),


                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // ------------------------------
                            // Production Countries Section
                            // ------------------------------
                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 10, right: 14),
                              child: const Text(
                                  "Genre",
                                  style: TextStyle(color: AppThemes.c6EACDA, fontSize: 14, fontWeight: FontWeight.bold)
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 4, right: 14, bottom: 10),
                              child: Text(
                                controller.movieDetailEntity.genresEntity!
                                    .map((item) => item.name).toList().join(" , "),
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            // ------------------------------
                            // Production Countries Section
                            // ------------------------------
                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 10, right: 14),
                              child: const Text(
                                  "Production Countries",
                                  style: TextStyle(color: AppThemes.c6EACDA, fontSize: 14, fontWeight: FontWeight.bold)
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 4, right: 14, bottom: 10),
                              child: Text(
                                  controller.movieDetailEntity.productionCountriesEntity!
                                      .map((item) => item.name).toList().join(" , "),
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            // ------------------------------
                            // Production Companies Section
                            // ------------------------------
                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 10, right: 14),
                              child: const Text(
                                  "Production Companies",
                                  style: TextStyle(color: AppThemes.c6EACDA, fontSize: 14, fontWeight: FontWeight.bold)
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 4, right: 14, bottom: 10),
                              child: Text(
                                controller.movieDetailEntity.productionCompaniesEntity!
                                    .map((item) => item.name).toList().join(" , "),
                                style: const TextStyle(color: Colors.white, fontSize: 12),
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            // ------------------------------
                            // Sypnosis Section
                            // ------------------------------
                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 10, right: 14),
                              child: const Text(
                                  "Synopsis",
                                  style: TextStyle(color: AppThemes.c6EACDA, fontSize: 20, fontWeight: FontWeight.bold)
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 10, right: 14, bottom: 10),
                              child: Text(
                                  controller.movieDetailEntity.overview.toString(),
                                  style: const TextStyle(color: Colors.white, fontSize: 14),
                                textAlign: TextAlign.justify,
                              ),
                            ),

                            // ------------------------------
                            // SIMILAR MOVIES SECTION
                            // ------------------------------
                            Container(
                              margin: const EdgeInsets.only(left: 14, top: 10, right: 14),
                              child: const Text(
                                  "Similar Movies",
                                  style: TextStyle(color: AppThemes.c6EACDA, fontSize: 20, fontWeight: FontWeight.bold)
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(left: 14, right: 14, bottom: 100),
                              child: SimilarMoviePage(
                                  movieId: controller.movieDetailEntity.id!.toInt(),
                                callback: (movieId){
                                    controller.getMovieDetail(movieId: movieId);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
          onEmpty: const Text("No Data yet"),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error){
            return Center(child: Text(error.toString()));
          }
      )
    );
  }
}
