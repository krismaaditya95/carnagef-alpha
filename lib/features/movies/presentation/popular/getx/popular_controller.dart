import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/popular_movie_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/popular/getx/popular_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/popular/pages/popular_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// [PopularController] is an GetxController for [PopularPage],
/// It implements [StateMixin] provided by Getx to easily handling the UI
/// The binding was declared in [PopularBinding]
/// -----------------------------------------------------------
class PopularController extends GetxController with StateMixin<MoviesResponseEntity>{

  final title = "Popular Movies";
  final PopularMovieUseCase _popularMovieUseCase;

  PopularController({required PopularMovieUseCase popularMovieUseCase})
      : _popularMovieUseCase = popularMovieUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getPopularMovies();
  }

  final popularMoviesResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getPopularMoviesResponse => popularMoviesResponseResult.value;
  MoviesResponseEntity get popularMoviesResponseEntity => getPopularMoviesResponse!.data ?? const MoviesResponseEntity();

  /// Fetch Popular Movies
  Future<void> getPopularMovies() async{
    change(null, status: RxStatus.loading());

    var paramRequest = GeneralMoviesParams(
        language: defaultLanguage,
        page: 1,
        accessTokenAuth: accessTokenAuth
    );

    await _popularMovieUseCase.call(
        paramRequest
    ).then((response){
      if(response.statusCode == 200){
        popularMoviesResponseResult(DataWrapper.success(response));
        change(response, status: RxStatus.success());
      }
    }, onError: (error){
      change(null, status: RxStatus.error(error.toString()));
    });

    debugPrint('STATUS CODE ==> ${popularMoviesResponseEntity.statusCode}');
    debugPrint('STATUS Message ==> ${popularMoviesResponseEntity.statusMessage}');
    debugPrint('RESULT LENGTH ==> ${popularMoviesResponseEntity.results!.length}');
  }
}