
import 'package:carnagef_alpha/features/movies/domain/usecases/watchlist_movies_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/watchlist_movies/getx/watchlist_movies_controller.dart';
import 'package:get/get.dart';

class WatchlistMoviesBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(WatchlistMoviesController(
      watchlistMoviesUseCase: Get.find<WatchlistMoviesUseCase>(),
    ));
  }
}