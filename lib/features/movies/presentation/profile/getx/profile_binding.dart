import 'package:get/get.dart';

class ProfileBinding extends Bindings{
  @override
  void dependencies() async {

    // Dependencies profile dipindah ke HOME BINDING !!!

    // Get.put<PersonalService>(
    //     PersonalServiceImpl(dio: Get.find<Dio>())
    // );
    //
    // Get.put<PersonalRepository>(
    //     PersonalRepositoryImpl(personalService: Get.find<PersonalService>())
    // );
    //
    // Get.put<WatchlistMoviesUseCase>(
    //     WatchlistMoviesUseCase(
    //         personalRepository: Get.find<PersonalRepository>()
    //     )
    // );
    //
    // Get.put<FavoriteMoviesUseCase>(
    //     FavoriteMoviesUseCase(
    //         personalRepository: Get.find<PersonalRepository>()
    //     )
    // );
    //
    // Get.put<LogoutUseCase>(
    //     LogoutUseCase(
    //         authenticationRepository: Get.find<AuthenticationRepository>()
    //     )
    // );
    //
    // Get.put(ProfileController(
    //   authenticationCheckUseCase: Get.find<AuthenticationCheckUseCase>(),
    //   logoutUseCase: Get.find<LogoutUseCase>(),
    //   deleteAuthenticationDataUseCase: Get.find<DeleteAuthenticationDataUseCase>(),
    //   watchlistMoviesUseCase: Get.find<WatchlistMoviesUseCase>(),
    //   favoriteMoviesUseCase: Get.find<FavoriteMoviesUseCase>(),
    // ));
  }
}