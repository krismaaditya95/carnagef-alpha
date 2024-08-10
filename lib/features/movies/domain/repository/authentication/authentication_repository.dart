import 'package:carnagef_alpha/features/movies/domain/entities/authentication/account_detail_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/delete_session_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/new_session_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/request_token_response_entity.dart';

abstract class AuthenticationRepository{

  Future<RequestTokenResponseEntity> createRequestToken({
    String? accessTokenAuth
  });

  Future<RequestTokenResponseEntity> validateRequestTokenWithLogin({
    String? userName,
    String? passWord,
    String? requestToken,
    String? accessTokenAuth
  });

  Future<NewSessionResponseEntity> createNewSession({
    String? requestToken,
    String? accessTokenAuth
  });

  Future<AccountDetailResponseEntity> getAccountDetail({
    String? sessionId,
    String? apiKey
  });

  Future<DeleteSessionResponseEntity> deleteSession({
    String? sessionId,
    String? accessTokenAuth
  });
}