import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/similar_movie_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/similar_movies/getx/similar_movie_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/similar_movies/pages/similar_movie_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [SimilarMovieController] is an GetxController for [SimilarMoviePage],
/// It implements [StateMixin] provided by Getx to easily handling the UI
/// The binding was declared in [SimilarMovieBinding]
/// -----------------------------------------------------------
class SimilarMovieController extends GetxController with StateMixin<MoviesResponseEntity>{
  final title = "Similar Movies";

  final SimilarMovieUseCase _similarMovieUseCase;

  SimilarMovieController({required SimilarMovieUseCase similarMovieUseCase})
      : _similarMovieUseCase = similarMovieUseCase;

  @override
  void onInit() async {
    super.onInit();
    // getSimilarMovies();
  }

  final similarMoviesResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getNowPlayingResponse => similarMoviesResponseResult.value;
  MoviesResponseEntity get moviesResponseEntity => getNowPlayingResponse!.data ?? const MoviesResponseEntity();

  /// Fetch Similar Movies by given [movieId]
  void getSimilarMovies({
    dynamic movieId
  }) async {
    debugPrint("getSimilarMovies dipanggil ===> .............");
    change(null, status: RxStatus.loading());

    var paramRequest = GeneralMoviesParams(
        movieId: movieId,
        page: 1,
        language: defaultLanguage,
        accessTokenAuth: accessTokenAuth
    );

    await _similarMovieUseCase.call(
        paramRequest
    ).then((response){

      if(response.statusCode != 6){
        similarMoviesResponseResult(DataWrapper.success(response));
        change(response, status: RxStatus.success());
      }
    }, onError: (error){
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}