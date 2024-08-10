import 'package:carnagef_alpha/features/movies/data/data_sources/remote/personal/personal_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/personal/personal_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/personal_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/personal_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/authentication_check_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/delete_authentication_data_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/logout_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/favorite_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/watchlist_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/getx/profile_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() async {

    Get.put<PersonalService>(
        PersonalServiceImpl(dio: Get.find<Dio>())
    );

    Get.put<PersonalRepository>(
        PersonalRepositoryImpl(personalService: Get.find<PersonalService>())
    );

    Get.put<WatchlistMoviesUseCase>(
        WatchlistMoviesUseCase(
            personalRepository: Get.find<PersonalRepository>()
        )
    );

    Get.put<FavoriteMoviesUseCase>(
        FavoriteMoviesUseCase(
            personalRepository: Get.find<PersonalRepository>()
        )
    );

    Get.put<LogoutUseCase>(
        LogoutUseCase(
            authenticationRepository: Get.find<AuthenticationRepository>()
        )
    );

    Get.put(ProfileController(
      authenticationCheckUseCase: Get.find<AuthenticationCheckUseCase>(),
      logoutUseCase: Get.find<LogoutUseCase>(),
      deleteAuthenticationDataUseCase: Get.find<DeleteAuthenticationDataUseCase>(),
      watchlistMoviesUseCase: Get.find<WatchlistMoviesUseCase>(),
      favoriteMoviesUseCase: Get.find<FavoriteMoviesUseCase>(),
    ));
  }
}