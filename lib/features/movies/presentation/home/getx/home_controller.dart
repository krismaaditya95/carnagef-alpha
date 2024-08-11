import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/authentication_check_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [HomeController] is an GetxController for [HomePage],
/// All the necessary bindings was declared in [HomeBinding]
/// -----------------------------------------------------------
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