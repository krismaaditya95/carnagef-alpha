import 'package:carnagef_alpha/core/constants/authentication_keys.dart';
import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/local_storage.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/account_detail_params.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/authentication_check_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/pages/login_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin{

  final title = "Home";
  var selectedMenuIndex = 0.obs;
  late TabController bottomNavigationController;

  final AuthenticationCheckUseCase _authenticationCheckUseCase;

  HomeController({required AuthenticationCheckUseCase authenticationCheckUseCase})
      : _authenticationCheckUseCase = authenticationCheckUseCase;

  final List<NavigationBarItem> menu = <NavigationBarItem>[
    NavigationBarItem(
      icon: Icons.play_circle_outline,
      text: 'Now Playing'
    ),
    NavigationBarItem(
        icon: Icons.stars_rounded,
        text: 'Popular'
    ),
    NavigationBarItem(
        icon: Icons.person_outline_outlined,
        text: 'Profile'
    ),
  ];

  @override
  void onInit() async {
    super.onInit();

    bottomNavigationController = TabController(length: 3, vsync: this, initialIndex: 0);
    bottomNavigationController.addListener((){
      debugPrint("Home Controller => masuk ke index ${bottomNavigationController.index}");
      selectedMenuIndex.value = bottomNavigationController.index;
    });
  }
}