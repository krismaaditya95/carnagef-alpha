import 'package:carnagef_alpha/core/constants/end_points.dart';
import 'package:carnagef_alpha/features/movies/data/data_sources/remote/authentication/authentication_service.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/account_detail_response_model.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/delete_session_response_model.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/new_session_response_model.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/request_token_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// implementation data source class of [AuthenticationService]
/// we perform all http request related to Authentication steps explained in TMDB API documentation
/// The Steps is :
/// [createRequestToken] => for creating request token
/// [validateRequestTokenWithLogin] => validating request token using User's TMDB username and password
/// [createNewSession] => after that, create new session that returns [session_id]
/// the returned [session_id] used for :
/// retrieving account detail in [getAccountDetail]
/// delete session in [deleteSession]
/// and another api such ass add to watchlist , add to favorite in another services
///

class AuthenticationServiceImpl implements AuthenticationService{

  final Dio _dio;
  AuthenticationServiceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<RequestTokenResponseModel> createRequestToken({String? accessTokenAuth}) async {
    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final httpResponse = await _dio.get(
      ApiEndPoints.createRequestToken,
      options: Options(headers: headers),
    );

    return RequestTokenResponseModel.fromJson(httpResponse.data);
  }

  @override
  Future<RequestTokenResponseModel> validateRequestTokenWithLogin({
    String? userName, String? passWord,
    String? requestToken, String? accessTokenAuth}) async {

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final httpResponse = await _dio.post(
        ApiEndPoints.validateRequestTokenWithLogin,
        options: Options(
            headers: headers,
            validateStatus: (value){
              if(value == 401 || value == 200) {
                return true;
              }
              return false;
            }),
        data: {
          "username": userName,
          "password": passWord,
          "request_token": requestToken
        }
    );

    return RequestTokenResponseModel.fromJson(httpResponse.data);

  }

  @override
  Future<NewSessionResponseModel> createNewSession({String? requestToken, String? accessTokenAuth}) async {

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final httpResponse = await _dio.post(
        ApiEndPoints.createNewSession,
        options: Options(headers: headers),
        data: {
          "request_token": requestToken
        }
    );

    return NewSessionResponseModel.fromJson(httpResponse.data);
  }

  @override
  Future<DeleteSessionResponseModel> deleteSession({
    String? sessionId, String? accessTokenAuth}) async {

    final headers = <String, dynamic>{
      'Authorization': 'Bearer $accessTokenAuth',
      'Accept': 'application/json'
    };

    final httpResponse = await _dio.delete(
        ApiEndPoints.deleteSession,
        options: Options(headers: headers),
        data: {
          "session_id": sessionId
        }
    );

    return DeleteSessionResponseModel.fromJson(httpResponse.data);
  }

  @override
  Future<AccountDetailResponseModel> getAccountDetail({String? sessionId, String? apiKey}) async {

    final headers = <String, dynamic>{
      'Accept': 'application/json'
    };

    final params = <String, dynamic>{
      'session_id': sessionId,
      'api_key': apiKey
    };

    final httpResponse = await _dio.get(
        ApiEndPoints.accountDetail,
        options: Options(
            headers: headers,
            validateStatus: (value){
              if(value == 401 || value == 200) {
                return true;
              }
              return false;
            }
        ),
        queryParameters: params
    );

    debugPrint('AUTHENTICATION SERVICE | HTTP_RESPONSE: ==> \n'
        'STATUS_CODE: ${httpResponse.statusCode}\n'
        'STATUS_MESSAGE: ${httpResponse.statusMessage}\n'
        'DATA: ${httpResponse.data}\n');

    return AccountDetailResponseModel.fromJson(httpResponse.data);
  }
}