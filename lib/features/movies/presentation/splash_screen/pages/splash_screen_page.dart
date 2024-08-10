import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/core/constants/assets.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/getx/login_controller.dart';
import 'package:carnagef_alpha/features/movies/presentation/splash_screen/getx/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenPage extends GetView<SplashController> {

  static const String routeName = '/splash-screen-page';
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(movieOverlay),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                AppThemes.black252525,
                BlendMode.multiply
            ),
          ),

        ),
        child: Center(
          child: Image.asset(
              movieIcon,
            width: 160,
          )
        )
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
