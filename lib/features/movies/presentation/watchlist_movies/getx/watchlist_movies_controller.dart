import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/core/constants/authentication_keys.dart';
import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/local_storage.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/add_to_watchlist_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/watchlist_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/pages/login_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/getx/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WatchlistMoviesController extends GetxController with StateMixin<MoviesResponseEntity>{
  final title = "My Watchlist";

  final WatchlistMoviesUseCase _watchlistMoviesUseCase;
  final AddToWatchlistUseCase _addToWatchlistUseCase;

  WatchlistMoviesController({
    required WatchlistMoviesUseCase watchlistMoviesUseCase,
    required AddToWatchlistUseCase addToWatchlistUseCase
  }) : _watchlistMoviesUseCase = watchlistMoviesUseCase,
        _addToWatchlistUseCase = addToWatchlistUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getWatchlistMovies();
  }

  var isWatchlistLoading = false.obs;
  var isRemoveLoading = false.obs;
  late ProfileController profileController;
  var sortByState = 'created_at.asc'.obs;

  final watchlistMoviesResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getWatchlistMoviesResponse => watchlistMoviesResponseResult.value;
  MoviesResponseEntity get watchlistMoviesResponseEntity => getWatchlistMoviesResponse!.data ?? const MoviesResponseEntity();

  final removeWatchlistResponseResult = Rxn<DataWrapper<GeneralEntity>>(DataWrapper.init());
  DataWrapper<GeneralEntity>? get getRemoveWatchlistResponse => removeWatchlistResponseResult.value;
  GeneralEntity get removeWatchlistEntity => getRemoveWatchlistResponse!.data ?? const GeneralEntity();

  Future<void> getWatchlistMovies({
    String? sortBy = 'created_at.asc'
  }) async {
    change(null, status: RxStatus.loading());
    isWatchlistLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    if(sessionId.toString() == ''){
      Get.offAllNamed(LoginPage.routeName);
    }else{
      await _watchlistMoviesUseCase.call(
          GeneralMoviesParams(
              language: defaultLanguage,
              page: defaultPage,
              sessionId: sessionId,
              sortBy: sortBy,
              accessTokenAuth: accessTokenAuth
          )
      ).then((response){
        watchlistMoviesResponseResult(DataWrapper.success(response));

        if(watchlistMoviesResponseEntity.totalResults! > 0 ){
          debugPrint('WATCHLIST CONTROLLER getWatchlistMovies|RESULT: ==> ${watchlistMoviesResponseEntity.results?.length}');
          change(response, status: RxStatus.success());
        }else{
          change(response, status: RxStatus.empty());
        }

      }, onError: (error){
        change(null, status: RxStatus.error(error.toString()));
      });
    }
    isWatchlistLoading.value = false;
  }

  Future<void> removeFromWatchlist({
    dynamic mediaId,
    dynamic mediaTitle
  }) async {
    debugPrint("removeFromWatchlist dipanggil........");
    isRemoveLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    var paramRequest = GeneralMoviesParams(
        mediaType: 'movie',
        mediaId: mediaId,
        watchlist: false,
        sessionId: sessionId,
        accessTokenAuth: accessTokenAuth
    );

    await _addToWatchlistUseCase.call(
        paramRequest
    ).then((response) async {

      // {"success":true,"status_code":13,"status_message":"The item/record was deleted successfully."}
      if(response.statusCode == 13){
        removeWatchlistResponseResult(DataWrapper.success(response));
        Get.snackbar('Success', 'Movie $mediaTitle has been removed from your watchlist',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            colorText: AppThemes.c021526
        );

        await getWatchlistMovies();
        profileController = Get.find<ProfileController>();
        await profileController.getWatchlistMovies();
      }
    }, onError: (error){

    });
    isRemoveLoading.value = false;
  }


}