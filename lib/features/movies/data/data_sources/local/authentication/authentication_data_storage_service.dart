
abstract class AuthenticationDataStorageService{

  Future<bool> isSessionIdEmpty();

  Future<String> retrieveRequestToken();

  Future<String> retrieveSessionId();

  Future<void> saveAuthenticationData({
    String? tokenExpireDate,
    String? requestToken,
    String? sessionId,
  });

  Future<void> deleteAuthenticationData({
    String? tokenExpireDate,
    String? requestToken,
    String? sessionId,
  });
}