class GeneralMoviesParams{
  int? movieId;
  String? language;
  int? page;
  String? sessionId;
  String? sortBy;
  String? accessTokenAuth;

  GeneralMoviesParams({
    this.movieId,
    this.language,
    this.page,
    this.sessionId,
    this.sortBy,
    this.accessTokenAuth
  });
}