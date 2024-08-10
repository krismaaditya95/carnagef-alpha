class ApiEndPoints {

  // Authentication
  static const String createRequestToken = '/authentication/token/new';
  static const String validateRequestTokenWithLogin = '/authentication/token/validate_with_login';
  static const String createNewSession = '/authentication/session/new';
  static const String deleteSession = '/authentication/session';
  static const String accountDetail = '/account';

  // static const String sampleApi = '';

  static const String nowPlaying = '/movie/now_playing';
  static const String popularMovies = '/movie/popular';

  static const String movieDetails = '/movie';
  static const String similarMovie = '/movie';

  static const String addToWatchlist = '/account/account_id/watchlist';
  static const String addToFavorite = '/account/account_id/favorite';
  static const String watchlistMovies = '/account/account_id/watchlist/movies';
  static const String favoriteMovies = '/account/account_id/favorite/movies';
}