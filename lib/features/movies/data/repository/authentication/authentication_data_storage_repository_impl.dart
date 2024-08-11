
import 'package:carnagef_alpha/features/movies/data/data_sources/local/authentication/authentication_data_storage_service.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_data_storage_repository.dart';

/// implementation repository class of [AuthenticationDataStorageRepository]
/// Communicates with [AuthenticationDataStorageService] and perform their member functions
///
class AuthenticationDataStorageRepositoryImpl implements AuthenticationDataStorageRepository{

  final AuthenticationDataStorageService _authenticationDataStorageService;

  AuthenticationDataStorageRepositoryImpl({
    required AuthenticationDataStorageService authenticationDataStorageService
  }) : _authenticationDataStorageService = authenticationDataStorageService;

  @override
  Future<bool> isSessionIdEmpty() async {
    return await _authenticationDataStorageService.isSessionIdEmpty();
  }

  @override
  Future<String> retrieveRequestToken() async {
    return await _authenticationDataStorageService.retrieveRequestToken();
  }

  @override
  Future<String> retrieveSessionId() async {
    return await _authenticationDataStorageService.retrieveSessionId();
  }

  @override
  Future<void> saveAuthenticationData({
    String? tokenExpireDate, String? requestToken, String? sessionId
  }) async {
    return await _authenticationDataStorageService.saveAuthenticationData(
        tokenExpireDate: tokenExpireDate,
        requestToken: requestToken,
        sessionId: sessionId
    );
  }

  @override
  Future<void> deleteAuthenticationData({
    String? tokenExpireDate,
    String? requestToken,
    String? sessionId}) async {
    return await _authenticationDataStorageService.deleteAuthenticationData();
  }

}