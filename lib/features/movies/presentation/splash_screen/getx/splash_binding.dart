import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/authentication_check_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/splash_screen/getx/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(SplashController(
        authenticationCheckUseCase: Get.find<AuthenticationCheckUseCase>()
    ));
  }
}