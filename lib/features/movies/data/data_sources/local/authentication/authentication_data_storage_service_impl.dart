
import 'package:carnagef_alpha/core/constants/authentication_keys.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/authentication/authentication_data_storage_service.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/local/local_storage.dart';

class AuthenticationDataStorageServiceImpl implements AuthenticationDataStorageService{

  @override
  Future<bool> isSessionIdEmpty() async {
    final value = await LocalStorage.getData<String?>(
      AuthenticationKeys.sessionId,
      defaultValue: null
    );

    return (value != null && value.isNotEmpty && value != '');
  }

  @override
  Future<String> retrieveRequestToken() async {
    final value = await LocalStorage.getData<String?>(
        AuthenticationKeys.requestToken,
        defaultValue: null
    );

    return value.toString();
  }

  @override
  Future<String> retrieveSessionId() async {
    final value = await LocalStorage.getData<String?>(
        AuthenticationKeys.sessionId,
        defaultValue: null
    );

    return value.toString();
  }

  @override
  Future<void> saveAuthenticationData({
    String? tokenExpireDate,
    String? requestToken,
    String? sessionId
  }) async {
    final result = await LocalStorage.saveData({
      AuthenticationKeys.tokenExpireDate: tokenExpireDate,
      AuthenticationKeys.requestToken: requestToken,
      AuthenticationKeys.sessionId: sessionId,
    });

    return result;
  }

  @override
  Future<void> deleteAuthenticationData({
    String? tokenExpireDate,
    String? requestToken,
    String? sessionId}) async {
     LocalStorage.deleteData();
  }
}