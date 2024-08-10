import 'package:carnagef_alpha/features/movies/data/data_sources/remote/authentication/authentication_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/authentication/authentication_service_impl.dart';
import 'package:carnagef_alpha/features/movies/data/repository/authentication/authentication_repository_impl.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/authentication_check_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/create_request_token_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/home/getx/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{

  @override
  Future<void> dependencies() async {

    Get.put(HomeController(
        authenticationCheckUseCase: Get.find<AuthenticationCheckUseCase>()
    ));
  }
}