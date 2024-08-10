import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/core/constants/assets.dart';
import 'package:carnagef_alpha/features/movies/presentation/favorite_movies/pages/favorite_movies_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/pages/movie_detail_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/getx/profile_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/watchlist_movies/pages/watchlist_movies_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/general_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {

  static const String routeName = '/profile-page';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.title),
          actions: [
            IconButton(onPressed: () {
              controller.getAccountDetail();
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
                        controller.getAccountDetail();
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.white
                        ),
                        child: SingleChildScrollView(
                          child: Container(
                            margin: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      border: Border(
                                        top: BorderSide(color: AppThemes.c03346E),
                                        left: BorderSide(color: AppThemes.c03346E),
                                        right: BorderSide(color: AppThemes.c03346E),
                                        bottom: BorderSide(color: AppThemes.c03346E),
                                      )
                                  ),
                                  child: Row(
                                    children: [
                                      // PROFILE IMAGE
                                      Container(
                                        margin: const EdgeInsets.only(left: 14),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(50.0),
                                          child: CachedNetworkImage(
                                            imageUrl: 'https://image.tmdb.org/t/p/original/${controller.accountDetailResponseEntity.avatar!.tmdb!.avatarPath.toString()}',
                                            width: 80,
                                            errorWidget: (error, url, stackTrace){
                                              return Image.network("https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg");
                                            },
                                          ),
                                        ),
                                      ),

                                      // PROFILE INFO (USERNAME, NAME, ID , ETC)
                                      Container(
                                        margin: const EdgeInsets.only(left: 14),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(bottom: 4),
                                              child: Text('Hi, ${controller.accountDetailResponseEntity.username.toString()}',
                                                  style: const TextStyle(
                                                      color: AppThemes.c03346E, fontSize: 14
                                                  )),
                                            ),

                                            Container(
                                                margin: const EdgeInsets.only(bottom: 4),
                                                child: Text(controller.accountDetailResponseEntity.id.toString(),
                                                    style: const TextStyle(color: AppThemes.c03346E)
                                                )
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // ===========================
                                // PROFILE MENU SECTION
                                // ===========================

                                // ===========================
                                // WATCHLIST SECTION
                                // ===========================
                                Container(
                                  margin: const EdgeInsets.only(top: 20, bottom: 14),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      // border: Border(
                                      //   top: BorderSide(color: AppThemes.c03346E),
                                      //   left: BorderSide(color: AppThemes.c03346E),
                                      //   right: BorderSide(color: AppThemes.c03346E),
                                      //   bottom: BorderSide(color: AppThemes.c03346E),
                                      // )
                                  ),
                                  child: Column(
                                    children: [
                                      // TOP SECTION
                                      Container(
                                        margin: const EdgeInsets.only(left: 14, right: 14, top: 6),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                "Your Watchlist",
                                                style: TextStyle(color: AppThemes.c021526, fontSize: 16, fontWeight: FontWeight.bold)
                                            ),

                                            GeneralButton(
                                                minimumSize: const Size(90, 40),
                                                maximumSize: const Size(90, 40),
                                                text: "See All",
                                                fontColor: AppThemes.c021526,
                                                buttonColor: AppThemes.c021526,
                                                callback: () async {
                                                  await Get.toNamed(WatchlistMoviesPage.routeName);
                                                }
                                            )
                                          ],
                                        ),
                                      ),

                                      // BOTTOM SECTION
                                      Obx((){
                                        if(controller.isWatchlistLoading.value == true){
                                          return Container(
                                            margin: const EdgeInsets.only(left: 14, top: 20, right: 14, bottom: 14),
                                            child: const CircularProgressIndicator(
                                              color: AppThemes.c03346E,
                                            ),
                                          );
                                        }else{
                                          if(controller.watchlistMoviesResponseEntity.totalResults! >= 0){
                                            return Container(
                                              margin: const EdgeInsets.only(top: 20, bottom: 14),
                                              child: CarouselSlider(
                                                items: controller.watchlistMoviesResponseEntity.results!
                                                    .map((item) => InkWell(
                                                      onTap: (){
                                                        Get.to(() => const MovieDetailPage(),
                                                            arguments: item.id);
                                                      },
                                                      child: CachedNetworkImage(
                                                        imageUrl: 'https://image.tmdb.org/t/p/original/${item.posterPath.toString()}',
                                                        width: 180,
                                                        errorWidget: (error, url, stackTrace){
                                                      return Image.network("https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg");
                                                     },
                                                    ))
                                                ).toList().sublist(0, controller.watchlistMoviesResponseEntity.totalResults),
                                                options: CarouselOptions(
                                                    autoPlay: true,
                                                    aspectRatio: 1.5,
                                                    // height: 160,
                                                    viewportFraction: 0.5,
                                                    enableInfiniteScroll: true,
                                                    onPageChanged: (index, reason){

                                                    },
                                                    padEnds: false
                                                ),
                                                carouselController: controller.watchlistCarouselController,
                                              ),
                                            );
                                          }else{
                                            return const Center(
                                                child: Text('You dont have watchlist yet', style: TextStyle(
                                                    fontSize: 16
                                                ))
                                            );
                                          }

                                        }
                                      }),
                                    ],
                                  ),
                                ),

                                // ===========================
                                // FAVORITE SECTION
                                // ===========================
                                Container(
                                  margin: const EdgeInsets.only(top: 20, bottom: 14),
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      // border: Border(
                                      //   top: BorderSide(color: AppThemes.c03346E),
                                      //   left: BorderSide(color: AppThemes.c03346E),
                                      //   right: BorderSide(color: AppThemes.c03346E),
                                      //   bottom: BorderSide(color: AppThemes.c03346E),
                                      // )
                                  ),
                                  child: Column(
                                    children: [
                                      // TOP SECTION
                                      Container(
                                        margin: const EdgeInsets.only(left: 14, right: 14, top: 6),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                                "Your Favorite Movies",
                                                style: TextStyle(color: AppThemes.c021526, fontSize: 16, fontWeight: FontWeight.bold)
                                            ),

                                            GeneralButton(
                                                minimumSize: const Size(90, 40),
                                                maximumSize: const Size(90, 40),
                                                text: "See All",
                                                fontColor: AppThemes.c021526,
                                                buttonColor: AppThemes.c021526,
                                                callback: () async {
                                                  await Get.toNamed(FavoriteMoviesPage.routeName);
                                                }
                                            )
                                          ],
                                        ),
                                      ),

                                      // BOTTOM SECTION
                                      Obx((){
                                        if(controller.isFavoriteLoading.value == true){
                                          return Container(
                                            margin: const EdgeInsets.only(left: 14, top: 20, right: 14, bottom: 14),
                                            child: const CircularProgressIndicator(
                                              color: AppThemes.c03346E,
                                            ),
                                          );
                                        }else{
                                          if(controller.favoriteMoviesResponseEntity.totalResults! >= 0){
                                            return Container(
                                              margin: const EdgeInsets.only(top: 20, bottom: 14),
                                              child: CarouselSlider(
                                                items: controller.favoriteMoviesResponseEntity.results!
                                                    .map((item) => InkWell(
                                                      onTap: (){
                                                        Get.to(() => const MovieDetailPage(),
                                                            arguments: item.id);
                                                      },
                                                      child: CachedNetworkImage(
                                                        imageUrl: 'https://image.tmdb.org/t/p/original/${item.posterPath.toString()}',
                                                        width: 180,
                                                        errorWidget: (error, url, stackTrace){
                                                      return Image.network("https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg");
                                                      }))
                                                ).toList().sublist(0, controller.favoriteMoviesResponseEntity.totalResults),
                                                options: CarouselOptions(
                                                    autoPlay: true,
                                                    aspectRatio: 1.5,
                                                    // height: 160,
                                                    viewportFraction: 0.5,
                                                    enableInfiniteScroll: true,
                                                    onPageChanged: (index, reason){

                                                    },
                                                    padEnds: false
                                                ),
                                                carouselController: controller.favoriteCarouselController,
                                              ),
                                            );
                                          }else{
                                            return const Center(
                                                child: Text('You dont have favorites yet', style: TextStyle(
                                                    fontSize: 16
                                                ))
                                            );
                                          }

                                        }
                                      }),
                                    ],
                                  ),
                                ),


                                // ===========================
                                // LOGOUT SECTION
                                // ===========================
                                Obx((){
                                  if(controller.isLogoutLoading.value == true){
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(right: 40),
                                          child: const CircularProgressIndicator(
                                            color: AppThemes.c03346E,
                                          ),
                                        ),
                                        const Text('Logging you out...', style: TextStyle(
                                            fontSize: 16
                                        ))
                                      ],
                                    );
                                  }else{
                                    return GeneralButton(
                                        minimumSize: const Size(double.infinity, 60),
                                        // maximumSize: const Size(double.infinity, 40),
                                        text: "Logout",
                                        fontColor: AppThemes.c03346E,
                                        buttonColor: AppThemes.c03346E,
                                        callback: () {
                                          Get.bottomSheet(
                                              Container(
                                                height: 200,
                                                padding: const EdgeInsets.all(14),
                                                decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10)
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets.only(bottom: 10),
                                                      child: const Text(
                                                          "Are you sure you want to Logout?",
                                                          style: TextStyle(color: AppThemes.c021526, fontSize: 18, fontWeight: FontWeight.bold)
                                                      ),
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Container(
                                                            child: GeneralButton(
                                                                minimumSize: const Size(140, 60),
                                                                // maximumSize: const Size(double.infinity, 40),
                                                                text: "Yes, Logout",
                                                                fontColor: AppThemes.c03346E,
                                                                buttonColor: AppThemes.c03346E,
                                                                callback: () async {
                                                                  Get.back();
                                                                  await controller.logout();
                                                                }
                                                            ),
                                                          ),
                                                        ),

                                                        Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: GeneralButton(
                                                              minimumSize: const Size(140, 60),
                                                              // maximumSize: const Size(double.infinity, 40),
                                                              text: "Cancel",
                                                              fontColor: AppThemes.c03346E,
                                                              buttonColor: AppThemes.c03346E,
                                                              callback: (){
                                                                Get.back();
                                                              }
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              )
                                          );
                                        }
                                    );
                                  }
                                }
                                )
                              ],
                            ),
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
