import 'package:carnagef_alpha/features/movies/presentation/favorite_movies/getx/favorite_movies_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/favorite_movies/pages/favorite_movies_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/home/getx/home_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/home/pages/home_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/getx/login_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/login/pages/login_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/getx/movie_detail_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/movie_detail/pages/movie_detail_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/now_playing/getx/now_playing_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/now_playing/pages/now_playing_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/popular/getx/popular_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/popular/pages/popular_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/getx/profile_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/profile/pages/profile_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/similar_movies/getx/similar_movie_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/similar_movies/pages/similar_movie_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/splash_screen/getx/splash_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/splash_screen/pages/splash_screen_page.dart';
import 'package:carnagef_alpha/features/movies/presentation/watchlist_movies/getx/watchlist_movies_binding.dart';
import 'package:carnagef_alpha/features/movies/presentation/watchlist_movies/pages/watchlist_movies_page.dart';
import 'package:get/get.dart';

const initialPageRoute = SplashScreenPage.routeName;

final GetPage splashScreenPage = GetPage(
    name: SplashScreenPage.routeName,
    page: () => const SplashScreenPage(),
    binding: SplashBinding()
);

final pageRoutes = [
  splashScreenPage,

  GetPage(
      name: HomePage.routeName,
      page: () => const HomePage(),
      binding: HomeBinding()
  ),
  GetPage(
      name: LoginPage.routeName,
      page: () => const LoginPage(),
      binding: LoginBinding()
  ),
  GetPage(
      name: NowPlayingPage.routeName,
      page: () => const NowPlayingPage(),
      binding: NowPlayingBinding()
  ),
  GetPage(
      name: PopularPage.routeName,
      page: () => const PopularPage(),
      binding: PopularBinding()
  ),
  GetPage(
      name: MovieDetailPage.routeName,
      page: () => const MovieDetailPage(),
      binding: MovieDetailBinding()
  ),
  // GetPage(
  //     name: SimilarMoviePage.routeName,
  //     page: () => const SimilarMoviePage(),
  //     binding: SimilarMovieBinding()
  // ),
  GetPage(
      name: ProfilePage.routeName,
      page: () => const ProfilePage(),
      binding: ProfileBinding()
  ),
  GetPage(
      name: WatchlistMoviesPage.routeName,
      page: () => const WatchlistMoviesPage(),
      binding: WatchlistMoviesBinding()
  ),
  GetPage(
      name: FavoriteMoviesPage.routeName,
      page: () => const FavoriteMoviesPage(),
      binding: FavoriteMoviesBinding()
  ),
];