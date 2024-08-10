import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/features/movies/presentation/home/getx/home_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/now_playing/getx/now_playing_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/now_playing/pages/now_playing_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/popular/getx/popular_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/popular/pages/popular_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/getx/profile_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/pages/profile_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {

  static const String routeName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Theme.of(context).colorScheme.primary,
      //   title: Text(controller.title),
      // ),
      body: TabBarView(
        controller: controller.bottomNavigationController,
        children: [
          Builder(builder: (context){
            NowPlayingBinding().dependencies();
            return const NowPlayingPage();
          }),
          Builder(builder: (context){
            PopularBinding().dependencies();
            return const PopularPage();
          }),
          Builder(builder: (context){
            ProfileBinding().dependencies();
            return const ProfilePage();
          }),
        ],
      ),

      bottomNavigationBar: const CustomBottomNavigationBar(
        foregroundColor: Colors.white,
        backgroundColor: AppThemes.c021526,
        selectedColor: AppThemes.c6EACDA,
      ),
      resizeToAvoidBottomInset: false,

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
