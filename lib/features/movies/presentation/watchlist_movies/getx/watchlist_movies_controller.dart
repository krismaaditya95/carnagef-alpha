import 'package:carnagef_alpha/core/constants/authentication_keys.dart';
import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/local_storage.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/watchlist_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchlistMoviesController extends GetxController with StateMixin<MoviesResponseEntity>{
  final title = "My Watchlist";

  final WatchlistMoviesUseCase _watchlistMoviesUseCase;

  WatchlistMoviesController({required WatchlistMoviesUseCase watchlistMoviesUseCase})
      : _watchlistMoviesUseCase = watchlistMoviesUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getWatchlistMovies();
  }

  var isWatchlistLoading = false.obs;

  final watchlistMoviesResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getWatchlistMoviesResponse => watchlistMoviesResponseResult.value;
  MoviesResponseEntity get watchlistMoviesResponseEntity => getWatchlistMoviesResponse!.data ?? const MoviesResponseEntity();

  Future<void> getWatchlistMovies() async {
    change(null, status: RxStatus.loading());
    isWatchlistLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    if(sessionId == null || sessionId.toString() == ''){
      Get.offAllNamed(LoginPage.routeName);
    }else{
      await _watchlistMoviesUseCase.call(
          GeneralMoviesParams(
              language: defaultLanguage,
              page: defaultPage,
              sessionId: sessionId,
              sortBy: 'created_at.asc',
              accessTokenAuth: accessTokenAuth
          )
      ).then((response){
        watchlistMoviesResponseResult(DataWrapper.success(response));
        change(response, status: RxStatus.success());

        if(watchlistMoviesResponseEntity.totalResults! >= 0 ){
          debugPrint('WATCHLIST CONTROLLER getWatchlistMovies|RESULT: ==> ${watchlistMoviesResponseEntity.results?.length}');
        }else{

        }

      }, onError: (error){
        change(null, status: RxStatus.error(error.toString()));
      });
    }
    isWatchlistLoading.value = false;
  }


}