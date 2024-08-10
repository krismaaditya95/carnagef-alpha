import 'package:carnagef_alpha/config/theme/app_themes.dart';
import 'package:carnagef_alpha/core/constants/authentication_keys.dart';
import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/local_storage.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/movie_detail_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/add_to_favorite_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/add_to_watchlist_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/download_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/movie_detail_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/getx/profile_controller.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class MovieDetailController extends GetxController with StateMixin<MovieDetailEntity>{

  final MovieDetailUseCase _movieDetailUseCase;
  final DownloadUseCase _downloadUseCase;
  final AddToWatchlistUseCase _addToWatchlistUseCase;
  final AddToFavoriteUseCase _addToFavoriteUseCase;

  MovieDetailController({
    required MovieDetailUseCase movieDetailUseCase,
    required DownloadUseCase downloadUseCase,
    required AddToWatchlistUseCase addToWatchlistUseCase,
    required AddToFavoriteUseCase addToFavoriteUseCase
  }) : _movieDetailUseCase = movieDetailUseCase,
        _downloadUseCase = downloadUseCase,
        _addToWatchlistUseCase = addToWatchlistUseCase,
        _addToFavoriteUseCase = addToFavoriteUseCase;

  dynamic arguments = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Movie Detail Page Args => $arguments');
  }

  var isFavoriteLoading = false.obs;
  var isWatchlistLoading = false.obs;
  late ProfileController profileController;

  final movieDetailResponseResult = Rxn<DataWrapper<MovieDetailEntity>>(DataWrapper.init());
  DataWrapper<MovieDetailEntity>? get getMovieDetailResponse => movieDetailResponseResult.value;
  MovieDetailEntity get movieDetailEntity => getMovieDetailResponse!.data ?? const MovieDetailEntity();

  final addToWatchlistResponseResult = Rxn<DataWrapper<GeneralEntity>>(DataWrapper.init());
  DataWrapper<GeneralEntity>? get getAddToWatchlistResponse => addToWatchlistResponseResult.value;
  GeneralEntity get watchlistEntity => getAddToWatchlistResponse!.data ?? const GeneralEntity();

  final addToFavoriteResponseResult = Rxn<DataWrapper<GeneralEntity>>(DataWrapper.init());
  DataWrapper<GeneralEntity>? get getAddToFavoriteResponse => addToFavoriteResponseResult.value;
  GeneralEntity get favoriteEntity => getAddToFavoriteResponse!.data ?? const GeneralEntity();

  void getMovieDetail({
    dynamic movieId
  }) async {
    debugPrint("getMovieDetail dipanggil ===> .............");
    change(null, status: RxStatus.loading());

    var paramRequest = MovieDetailParams(
        movieId: movieId,
        language: defaultLanguage,
        accessTokenAuth: accessTokenAuth
    );

    await _movieDetailUseCase.call(
        paramRequest
    ).then((response){

      if(response.statusCode != 6){
        movieDetailResponseResult(DataWrapper.success(response));
        change(response, status: RxStatus.success());
      }
    }, onError: (error){
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  Future<void> addToWatchlist({
    dynamic mediaId,
    dynamic mediaTitle
  }) async {
    debugPrint("addToWatchlist dipanggil........");
    isWatchlistLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    var paramRequest = GeneralMoviesParams(
        mediaType: 'movie',
        mediaId: mediaId,
        watchlist: true,
        sessionId: sessionId,
        accessTokenAuth: accessTokenAuth
    );

    await _addToWatchlistUseCase.call(
        paramRequest
    ).then((response) async {

      if(response.statusCode == 1 || response.statusCode == 12){
        addToWatchlistResponseResult(DataWrapper.success(response));
        Get.snackbar('Success', 'Movie $mediaTitle added to your watchlist',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            colorText: AppThemes.c021526
        );
        profileController = Get.find<ProfileController>();
        await profileController.getWatchlistMovies();
      }
    }, onError: (error){

    });
    isWatchlistLoading.value = false;
  }

  Future<void> addToFavorite({
    dynamic mediaId,
    dynamic mediaTitle
  }) async {
    debugPrint("addToFavorite dipanggil........");
    isFavoriteLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    var paramRequest = GeneralMoviesParams(
        mediaType: 'movie',
        mediaId: mediaId,
        favorite: true,
        sessionId: sessionId,
        accessTokenAuth: accessTokenAuth
    );

    await _addToFavoriteUseCase.call(
        paramRequest
    ).then((response) async {

      if(response.statusCode == 1 || response.statusCode == 12){
        addToFavoriteResponseResult(DataWrapper.success(response));
        Get.snackbar('Success', 'Movie $mediaTitle added to your favorite',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 3),
            colorText: AppThemes.c021526
        );
        profileController = Get.find<ProfileController>();
        await profileController.getFavoriteMovies();
      }
    }, onError: (error){

    });
    isFavoriteLoading.value = false;
  }

  Future<bool> checkStoragePermission() async {
    AndroidDeviceInfo deviceInfo = await DeviceInfoPlugin().androidInfo;

    // android 11 ke atas (api 30-33)
    if(deviceInfo.version.sdkInt >= 30){
      var permission = await Permission.manageExternalStorage.request();

      if(permission.isGranted){
        // Get.snackbar("Storage Permission : ", "Granted");
        return true;
      }else{
        Get.snackbar("Storage Permission : ", "Not Granted");
        return false;
      }
    }// dibawah android 11
    else{
      var permission = Permission.storage;

      if(await permission.isGranted){
        // Get.snackbar("Storage Permission : ", "Granted");
        return true;
      }else{
        var permissionResult = await permission.request();
        if(permissionResult.isGranted){
          // Get.snackbar("Storage Permission : ", "Granted");
          return true;
        }else{
          Get.snackbar("Storage Permission : ", "Not Granted");
          return false;
        }
      }
    }

  }

  void listenToDownload(int received, int total) async {
    var percentage = (received / total * 100);

    if (percentage == 100.0){
      debugPrint('download image complete');
      Get.snackbar('Your Image saved successfully', '',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          colorText: Colors.white
      );
    }else{
      debugPrint('download image progress : $percentage');
    }
  }

  void downloadImage({
    dynamic imageUrl
  }) async {
    if(await checkStoragePermission()){

      await _downloadUseCase.download(listenToDownload, imageUrl);
    }
  }
}