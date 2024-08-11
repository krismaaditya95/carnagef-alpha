import 'package:carnagef_alpha/config/env.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/authentication/authentication_data_storage_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/authentication/authentication_data_storage_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/authentication/authentication_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/authentication/authentication_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/authentication/authentication_data_storage_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/authentication/authentication_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_data_storage_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/authentication_check_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/create_request_token_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/create_session_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/delete_authentication_data_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/login_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/save_authentication_data_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

/// Main Binding Class for GetX dependency injections
/// I put all the crucial / important and necessary data sources, repositories, and usecases here
class AppBindings extends Bindings{
  @override
  Future<void> dependencies() async {
    Get.put<Dio>(dio(), permanent: true);

    // inject Authentication Services -------------------------
    Get.put<AuthenticationService>(
        AuthenticationServiceImpl(dio: Get.find<Dio>())
    );

    Get.put<AuthenticationRepository>(
        AuthenticationRepositoryImpl(authenticationService: Get.find<AuthenticationService>())
    );

    Get.put<CreateRequestTokenUseCase>(
        CreateRequestTokenUseCase(
          authenticationRepository: Get.find<AuthenticationRepository>()
        )
    );

    Get.put<LoginUseCase>(
        LoginUseCase(
            authenticationRepository: Get.find<AuthenticationRepository>()
        )
    );

    Get.put<CreateSessionUseCase>(
        CreateSessionUseCase(
            authenticationRepository: Get.find<AuthenticationRepository>()
        )
    );

    Get.put<AuthenticationCheckUseCase>(
        AuthenticationCheckUseCase(
            authenticationRepository: Get.find<AuthenticationRepository>()
        )
    );

    // LOCAL STORAGE SERVICES ==============================
    Get.put<AuthenticationDataStorageService>(
        AuthenticationDataStorageServiceImpl()
    );

    Get.put<AuthenticationDataStorageRepository>(
        AuthenticationDataStorageRepositoryImpl(authenticationDataStorageService: Get.find<AuthenticationDataStorageService>())
    );

    // catatan : SaveAuthenticationDataUseCase ini nanti dipindah ke login bindings
    Get.put<SaveAuthenticationDataUseCase>(
        SaveAuthenticationDataUseCase(
            authenticationDataStorageRepository: Get.find<AuthenticationDataStorageRepository>()
        )
    );

    Get.put<DeleteAuthenticationDataUseCase>(
        DeleteAuthenticationDataUseCase(
            authenticationDataStorageRepository: Get.find<AuthenticationDataStorageRepository>()
        )
    );


  }

  Dio dio(){
    // final isLogAllowed = AppEnvironment.environment == Environment.dev;

    final dioInstance = Dio(
        BaseOptions(
            baseUrl: AppEnvironment.baseApiUrl,
            connectTimeout: const Duration(minutes: 1)
        )
    );

    dioInstance.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        requestBody: true,
        error: true
    ));

    return dioInstance;
  }
}