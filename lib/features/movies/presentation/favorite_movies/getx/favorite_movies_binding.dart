import 'package:carnagef_alpha/features/movies/domain/usecases/add_to_favorite_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/favorite_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/favorite_movies/getx/favorite_movies_controller.dart';
import 'package:get/get.dart';

class FavoriteMoviesBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(FavoriteMoviesController(
      favoriteMoviesUseCase: Get.find<FavoriteMoviesUseCase>(),
      addToFavoriteUseCase: Get.find<AddToFavoriteUseCase>()
    ));
  }
}