
import 'package:carnagef_alpha/features/movies/data/models/authentication/account_detail_response_model.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/delete_session_response_model.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/new_session_response_model.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/request_token_response_model.dart';

abstract class AuthenticationService{

  Future<RequestTokenResponseModel> createRequestToken({
    String? accessTokenAuth
  });

  Future<RequestTokenResponseModel> validateRequestTokenWithLogin({
    String? userName,
    String? passWord,
    String? requestToken,
    String? accessTokenAuth
  });

  Future<NewSessionResponseModel> createNewSession({
    String? requestToken,
    String? accessTokenAuth
  });

  Future<AccountDetailResponseModel> getAccountDetail({
    String? sessionId,
    String? apiKey
  });

  Future<DeleteSessionResponseModel> deleteSession({
    String? sessionId,
    String? accessTokenAuth
  });

}