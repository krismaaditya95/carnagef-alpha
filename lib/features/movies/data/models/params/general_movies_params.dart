class GeneralMoviesParams{
  int? movieId;
  String? language;
  int? page;
  String? sessionId;
  String? sortBy;
  String? accessTokenAuth;
  String? mediaType;
  num? mediaId;
  bool? watchlist;
  bool? favorite;

  GeneralMoviesParams({
    this.movieId,
    this.language,
    this.page,
    this.sessionId,
    this.sortBy,
    this.accessTokenAuth,
    this.mediaType,
    this.mediaId,
    this.watchlist,
    this.favorite
  });
}