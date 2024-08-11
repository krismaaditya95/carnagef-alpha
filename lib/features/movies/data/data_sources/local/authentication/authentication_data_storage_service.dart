
/// abstract class for local data source layer : Authentication
/// used for retrieving , save, and delete data that stored in Hive
abstract class AuthenticationDataStorageService{

  /// retrieve status whether sessionId is empty or not
  Future<bool> isSessionIdEmpty();

  /// retrieve requestToken
  Future<String> retrieveRequestToken();

  /// retrieve sessionId
  Future<String> retrieveSessionId();

  /// save expiredate, requestToken, sessionId to Hive
  Future<void> saveAuthenticationData({
    String? tokenExpireDate,
    String? requestToken,
    String? sessionId,
  });

  /// delete all keys and value
  /// however, i just put all parameter just in case i need it in the future
  /// for example delete specific keys and value like requestToken or sessionId
  Future<void> deleteAuthenticationData({
    String? tokenExpireDate,
    String? requestToken,
    String? sessionId,
  });
}