import 'package:carnagef_alpha/core/constants/authentication_keys.dart';
import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/local_storage.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/account_detail_params.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/delete_session_params.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/save_authentication_data_params.dart';
import 'package:carnagef_alpha/features/movies/data/models/params/general_movies_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/account_detail_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/movies_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/authentication_check_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/delete_authentication_data_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/logout_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/favorite_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/watchlist_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<AccountDetailResponseEntity>{
  final title = "Profile";

  final AuthenticationCheckUseCase _authenticationCheckUseCase;
  final LogoutUseCase _logoutUseCase;
  final DeleteAuthenticationDataUseCase _deleteAuthenticationDataUseCase;
  final WatchlistMoviesUseCase _watchlistMoviesUseCase;
  final FavoriteMoviesUseCase _favoriteMoviesUseCase;

  ProfileController({
    required AuthenticationCheckUseCase authenticationCheckUseCase,
    required LogoutUseCase logoutUseCase,
    required DeleteAuthenticationDataUseCase deleteAuthenticationDataUseCase,
    required WatchlistMoviesUseCase watchlistMoviesUseCase,
    required FavoriteMoviesUseCase favoriteMoviesUseCase
  }) : _authenticationCheckUseCase = authenticationCheckUseCase,
        _logoutUseCase = logoutUseCase,
        _deleteAuthenticationDataUseCase= deleteAuthenticationDataUseCase,
        _watchlistMoviesUseCase = watchlistMoviesUseCase,
        _favoriteMoviesUseCase = favoriteMoviesUseCase;

  @override
  void onInit() async {
    super.onInit();
    await getAccountDetail();
    await getWatchlistMovies();
  }

  var isLogoutLoading = false.obs;
  var isFavoriteLoading = false.obs;
  var isWatchlistLoading = false.obs;

  // account detail
  final accountDetailResponseResult = Rxn<DataWrapper<AccountDetailResponseEntity>>(DataWrapper.init());
  DataWrapper<AccountDetailResponseEntity>? get getAccountDetailResponse => accountDetailResponseResult.value;
  AccountDetailResponseEntity get accountDetailResponseEntity => getAccountDetailResponse!.data ?? const AccountDetailResponseEntity();

  // watchlist
  final watchlistMoviesResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getWatchlistMoviesResponse => watchlistMoviesResponseResult.value;
  MoviesResponseEntity get watchlistMoviesResponseEntity => getWatchlistMoviesResponse!.data ?? const MoviesResponseEntity();

  // favorite
  final favoriteMoviesResponseResult = Rxn<DataWrapper<MoviesResponseEntity>>(DataWrapper.init());
  DataWrapper<MoviesResponseEntity>? get getFavoriteMoviesResponse => favoriteMoviesResponseResult.value;
  MoviesResponseEntity get favoriteMoviesResponseEntity => getFavoriteMoviesResponse!.data ?? const MoviesResponseEntity();

  Future<void> getAccountDetail() async {
    change(null, status: RxStatus.loading());
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');
    final tokenExpireDate = await LocalStorage.getData(AuthenticationKeys.tokenExpireDate, defaultValue: '');
    final requestToken = await LocalStorage.getData(AuthenticationKeys.requestToken, defaultValue: '');

    debugPrint('PROFILE Controller checkSessionStatus ==> \n'
        'TOKEN_EXPIRE_DATE: $tokenExpireDate\n'
        'REQUEST_TOKEN: $requestToken\n'
        'SESSION_ID: $sessionId');

    if(sessionId == null || sessionId.toString() == ''){
      Get.offAllNamed(LoginPage.routeName);
    }else{
      await _authenticationCheckUseCase.call(
          AccountDetailParams(
              sessionId: sessionId,
              apiKey: apiKeyAuth
          )
      ).then((response){
        accountDetailResponseResult(DataWrapper.success(response));
        debugPrint('PROFILE Controller checkSessionStatus|SUCCESS: ==> ${accountDetailResponseEntity.success}');
        debugPrint('PROFILE Controller checkSessionStatus|STATUS_CODE: ==> ${accountDetailResponseEntity.statusCode}');
        debugPrint('PROFILE Controller checkSessionStatus|STATUS_MESSAGE: ==> ${accountDetailResponseEntity.statusMessage}');

        if(accountDetailResponseEntity.id != null ){
          change(response, status: RxStatus.success());
          debugPrint('PROFILE Controller checkSessionStatus|ID: ==> ${accountDetailResponseEntity.id}');
          debugPrint('PROFILE Controller checkSessionStatus|NAME: ==> ${accountDetailResponseEntity.name}');
          debugPrint('PROFILE Controller checkSessionStatus|USERNAME: ==> ${accountDetailResponseEntity.username}');
        }else{
          if(accountDetailResponseEntity.success == false ||
              accountDetailResponseEntity.statusCode == 3 ||
              accountDetailResponseEntity.statusMessage.toString().toLowerCase().contains("authentication failed")){
            Get.offAllNamed(LoginPage.routeName);
          }
        }

      }, onError: (error){
        change(null, status: RxStatus.error(error.toString()));
      });
    }
  }

  Future<void> getWatchlistMovies() async {
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

        if(watchlistMoviesResponseEntity.totalResults! >= 0 ){
          debugPrint('PROFILE Controller getWatchlistMovies|RESULT: ==> ${watchlistMoviesResponseEntity.results?.length}');
        }else{
          if(accountDetailResponseEntity.success == false ||
              accountDetailResponseEntity.statusCode == 3 ||
              accountDetailResponseEntity.statusMessage.toString().toLowerCase().contains("authentication failed")){
            Get.offAllNamed(LoginPage.routeName);
          }
        }

      }, onError: (error){

      });
    }
  }

  Future<void> logout() async {
    debugPrint('PROFILE Controller | Logging you out......');
    isLogoutLoading.value = true;
    final sessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

    debugPrint('PROFILE Controller logout|SESSION_ID: ==> $sessionId');

    if(sessionId == null || sessionId.toString() == ''){
      Get.offAllNamed(LoginPage.routeName);
    }else{
      await _logoutUseCase.call(
          DeleteSessionParams(
              sessionId: sessionId,
              accessTokenAuth: accessTokenAuth
          )
      ).then((response) async {
        debugPrint('PROFILE Controller logout|SUCCESS: ==> ${response.success}');

        if(response.success == true){

          await _deleteAuthenticationDataUseCase.call(
              SaveAuthenticationDataParams()
          ).then((_) async {

            final latestTokenExpireDate = await LocalStorage.getData(AuthenticationKeys.tokenExpireDate, defaultValue: '');
            final latestRequestToken = await LocalStorage.getData(AuthenticationKeys.requestToken, defaultValue: '');
            final latestSessionId = await LocalStorage.getData(AuthenticationKeys.sessionId, defaultValue: '');

            debugPrint('PROFILE Controller Clearing Local DATA ==> \n'
                'tokenExpireDate: $latestTokenExpireDate\n'
                'requestToken: $latestRequestToken\n'
                'sessionId: $latestSessionId');

            Get.offAllNamed(LoginPage.routeName);
          });

        }else{
          //"success": false,
          //     "status_code": 34,
          //     "status_message": "The resource you requested could not be found."
          // Get.offAllNamed(LoginPage.routeName);
        }
      }, onError: (error){
        Get.snackbar('Error', '$error',
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(seconds: 2),
            colorText: Colors.black54
        );
      });
    }
    isLogoutLoading.value = false;
    debugPrint('PROFILE Controller | Logout Complete..!');
  }
}