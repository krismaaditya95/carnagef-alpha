import 'package:carnagef_alpha/core/constants/authentication_keys.dart';
import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/local_storage.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/favorite_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteMoviesController extends GetxController with StateMixin<MoviesResponseEntity>{
  final title = "My Favorites";

  final FavoriteMoviesUseCase _favoriteMoviesUseCase;

  FavoriteMoviesController({required FavoriteMoviesUseCase favoriteMoviesUseCase})
      : _favoriteMoviesUseCase = favoriteMoviesUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getFavoriteMovies();
  }

  var isFavoriteLoading = false.obs;

  final favoriteMoviesResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getFavoriteMoviesResponse => favoriteMoviesResponseResult.value;
  MoviesResponseEntity get favoriteMoviesResponseEntity => getFavoriteMoviesResponse!.data ?? const MoviesResponseEntity();

  Future<void> getFavoriteMovies() async {
    change(null, status: RxStatus.loading());
    isFavoriteLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    if(sessionId == null || sessionId.toString() == ''){
      Get.offAllNamed(LoginPage.routeName);
    }else{
      await _favoriteMoviesUseCase.call(
          GeneralMoviesParams(
              language: defaultLanguage,
              page: defaultPage,
              sessionId: sessionId,
              sortBy: 'created_at.asc',
              accessTokenAuth: accessTokenAuth
          )
      ).then((response){
        favoriteMoviesResponseResult(DataWrapper.success(response));
        change(response, status: RxStatus.success());

        if(favoriteMoviesResponseEntity.totalResults! >= 0 ){
          debugPrint('FAVORITE CONTROLLER getFavoriteMovies|RESULT LENGTH: ==> ${favoriteMoviesResponseEntity.results?.length}');
        }else{

        }

      }, onError: (error){
        change(null, status: RxStatus.error(error.toString()));
      });
    }
    isFavoriteLoading.value = false;
  }


}