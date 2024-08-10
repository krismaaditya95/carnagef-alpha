import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/core/resources/data_state.dart';
import 'package:carnagef_alpha/features/movies/data/models/movies_response_model.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/now_playing_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NowPlayingController extends GetxController with StateMixin<MoviesResponseEntity>{
  final title = "Now Playing";

  final NowPlayingUseCase _nowPlayingUseCase;

  NowPlayingController({required NowPlayingUseCase nowPlayingUseCase})
      : _nowPlayingUseCase = nowPlayingUseCase;

  @override
  void onInit() async {
    super.onInit();
    getNowPlayingMovies();
  }

  final nowPlayingResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getNowPlayingResponse => nowPlayingResponseResult.value;
  MoviesResponseEntity get moviesResponseEntity => getNowPlayingResponse!.data ?? const MoviesResponseEntity();

  void getNowPlayingMovies() async{

    change(null, status: RxStatus.loading());

    var paramRequest = GeneralMoviesParams(
      language: defaultLanguage,
      page: 1,
      accessTokenAuth: accessTokenAuth
    );

    // final response = await _nowPlayingUseCase.call(
    //   paramRequest
    // );

    await _nowPlayingUseCase.call(
        paramRequest
    ).then((response){
      if(response.statusCode == 200){
        nowPlayingResponseResult(DataWrapper.success(response));
        change(response, status: RxStatus.success());
      }
    }, onError: (error){
      change(null, status: RxStatus.error(error.toString()));
    });

    // if(response.statusCode == 200){
    //   nowPlayingResponseResult(DataWrapper.success(response));
    // }

    // if(response.statusCode == 200){
    //   nowPlayingResponseResult(DataWrapper.success(response));
    //   change(response, status: RxStatus.success());
    // }

    debugPrint('STATUS CODE ==> ${moviesResponseEntity.statusCode}');
    debugPrint('STATUS Message ==> ${moviesResponseEntity.statusMessage}');
    debugPrint('RESULT LENGTH ==> ${moviesResponseEntity.results!.length}');
  }
}