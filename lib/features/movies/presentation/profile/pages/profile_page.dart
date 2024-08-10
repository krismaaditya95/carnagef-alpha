import 'package:cached_network_image/cached_network_image.dart';
import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/getx/profile_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/general_button.dart';
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
                          color: AppThemes.cE2E2B6
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10, top: 10),
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

                              Container(
                                margin: const EdgeInsets.only(left: 10,top: 10, right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 4),
                                      child: Text(controller.accountDetailResponseEntity.username.toString(),
                                          style: const TextStyle(
                                              color: Colors.black, fontSize: 20
                                          )),
                                    ),

                                    Container(
                                        margin: const EdgeInsets.only(bottom: 4),
                                        child: Text(controller.accountDetailResponseEntity.id.toString(),
                                            style: const TextStyle(color: Colors.black)
                                        )
                                    ),
                                  ],
                                ),
                              ),

                              // ------------------------------
                              // PROFILE MENUS SECTION
                              // ------------------------------
                              Container(
                                margin: const EdgeInsets.only(left: 14, top: 100, right: 14, bottom: 40),
                                child: const Text(
                                    "Your Profile Menu",
                                    style: TextStyle(color: AppThemes.c6EACDA, fontSize: 14, fontWeight: FontWeight.bold)
                                ),
                              ),

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
