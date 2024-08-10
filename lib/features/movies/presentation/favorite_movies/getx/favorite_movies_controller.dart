import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/core/constants/authentication_keys.dart';
import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/local_storage.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/add_to_favorite_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/favorite_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/pages/login_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/getx/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteMoviesController extends GetxController with StateMixin<MoviesResponseEntity>{
  final title = "My Favorites";

  final FavoriteMoviesUseCase _favoriteMoviesUseCase;
  final AddToFavoriteUseCase _addToFavoriteUseCase;

  FavoriteMoviesController({
    required FavoriteMoviesUseCase favoriteMoviesUseCase,
    required AddToFavoriteUseCase addToFavoriteUseCase
  }) : _favoriteMoviesUseCase = favoriteMoviesUseCase,
        _addToFavoriteUseCase = addToFavoriteUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getFavoriteMovies();
  }

  var isFavoriteLoading = false.obs;
  var isRemoveLoading = false.obs;
  late ProfileController profileController;
  var sortByState = 'created_at.asc'.obs;

  final favoriteMoviesResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getFavoriteMoviesResponse => favoriteMoviesResponseResult.value;
  MoviesResponseEntity get favoriteMoviesResponseEntity => getFavoriteMoviesResponse!.data ?? const MoviesResponseEntity();

  final removeFavoriteResponseResult = Rxn<DataWrapper<GeneralEntity>>(DataWrapper.init());
  DataWrapper<GeneralEntity>? get getRemoveFavoriteResponse => removeFavoriteResponseResult.value;
  GeneralEntity get removeFavoriteEntity => getRemoveFavoriteResponse!.data ?? const GeneralEntity();

  Future<void> getFavoriteMovies({
    String? sortBy = 'created_at.asc'
  }) async {
    change(null, status: RxStatus.loading());
    isFavoriteLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    if(sessionId.toString() == ''){
      Get.offAllNamed(LoginPage.routeName);
    }else{
      await _favoriteMoviesUseCase.call(
          GeneralMoviesParams(
              language: defaultLanguage,
              page: defaultPage,
              sessionId: sessionId,
              sortBy: sortBy,
              accessTokenAuth: accessTokenAuth
          )
      ).then((response){
        favoriteMoviesResponseResult(DataWrapper.success(response));

        if(favoriteMoviesResponseEntity.totalResults! > 0 ){
          debugPrint('FAVORITE CONTROLLER getFavoriteMovies|RESULT LENGTH: ==> ${favoriteMoviesResponseEntity.results?.length}');
          change(response, status: RxStatus.success());
        }else{
          change(response, status: RxStatus.empty());
        }

      }, onError: (error){
        change(null, status: RxStatus.error(error.toString()));
      });
    }
    isFavoriteLoading.value = false;
  }

  Future<void> removeFromFavorite({
    dynamic mediaId,
    dynamic mediaTitle
  }) async {
    debugPrint("removeFromFavorite dipanggil........");
    isRemoveLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    var paramRequest = GeneralMoviesParams(
        mediaType: 'movie',
        mediaId: mediaId,
        favorite: false,
        sessionId: sessionId,
        accessTokenAuth: accessTokenAuth
    );

    await _addToFavoriteUseCase.call(
        paramRequest
    ).then((response) async {

      // {"success":true,"status_code":13,"status_message":"The item/record was deleted successfully."}
      if(response.statusCode == 13){
        removeFavoriteResponseResult(DataWrapper.success(response));
        Get.snackbar('Success', 'Movie $mediaTitle has been removed from your favorite',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            colorText: AppThemes.c021526
        );

        await getFavoriteMovies();
        profileController = Get.find<ProfileController>();
        await profileController.getFavoriteMovies();
      }
    }, onError: (error){

    });
    isRemoveLoading.value = false;
  }


}