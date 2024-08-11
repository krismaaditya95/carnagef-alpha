import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/create_request_token_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/create_session_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/login_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/save_authentication_data_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/getx/login_controller.dart';
import 'package:get/get.dart';

/// Bindings for [Login]
class LoginBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController(
        createRequestTokenUseCase: Get.find<CreateRequestTokenUseCase>(),
        loginUseCase: Get.find<LoginUseCase>(),
        createSessionUseCase: Get.find<CreateSessionUseCase>(),
        saveAuthenticationDataUseCase: Get.find<SaveAuthenticationDataUseCase>())
    );
  }
}