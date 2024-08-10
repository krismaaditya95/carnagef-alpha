import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/movie_detail_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movie_detail_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/download_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/movie_detail_usecase.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class MovieDetailController extends GetxController with StateMixin<MovieDetailEntity>{

  final MovieDetailUseCase _movieDetailUseCase;
  final DownloadUseCase _downloadUseCase;

  MovieDetailController(
      {required MovieDetailUseCase movieDetailUseCase,
        required DownloadUseCase downloadUseCase})
      : _movieDetailUseCase = movieDetailUseCase,
        _downloadUseCase = downloadUseCase;

  dynamic arguments = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    debugPrint('Movie Detail Page Args => $arguments');
  }

  final movieDetailResponseResult = Rxn<DataWrapper<MovieDetailEntity>>(DataWrapper.init());
  DataWrapper<MovieDetailEntity>? get getMovieDetailResponse => movieDetailResponseResult.value;
  MovieDetailEntity get movieDetailEntity => getMovieDetailResponse!.data ?? const MovieDetailEntity();

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