import 'package:carnagef_alpha/features/movies/data/data_sources/remote/authentication/authentication_service.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/authentication/account_detail_mapper/account_detail_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/authentication/delete_session_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/authentication/new_session_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/data/mapper/authentication/request_token_response_mapper.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/account_detail_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/delete_session_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/new_session_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/request_token_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';

/// implementation repository class of [AuthenticationRepository]
/// Communicates with [AuthenticationService] and perform their member functions
///
class AuthenticationRepositoryImpl implements AuthenticationRepository{

  final AuthenticationService _authenticationService;

  AuthenticationRepositoryImpl({required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  @override
  Future<RequestTokenResponseEntity> createRequestToken({String? accessTokenAuth}) async {
    var response = await _authenticationService.createRequestToken(
        accessTokenAuth: accessTokenAuth
    );

    return RequestTokenResponseMapper.toEntity(response);
  }

  @override
  Future<RequestTokenResponseEntity> validateRequestTokenWithLogin({
    String? userName, String? passWord,
    String? requestToken, String? accessTokenAuth}) async {

    var response = await _authenticationService.validateRequestTokenWithLogin(
      userName: userName,
      passWord: passWord,
      requestToken: requestToken,
      accessTokenAuth: accessTokenAuth
    );

    return RequestTokenResponseMapper.toEntity(response);
  }

  @override
  Future<NewSessionResponseEntity> createNewSession({String? requestToken, String? accessTokenAuth}) async {
    var response = await _authenticationService.createNewSession(
        requestToken: requestToken,
        accessTokenAuth: accessTokenAuth
    );

    return NewSessionResponseMapper.toEntity(response);
  }

  @override
  Future<DeleteSessionResponseEntity> deleteSession({String? sessionId, String? accessTokenAuth}) async {
    var response = await _authenticationService.deleteSession(
        sessionId: sessionId,
        accessTokenAuth: accessTokenAuth
    );

    return DeleteSessionResponseMapper.toEntity(response);
  }

  @override
  Future<AccountDetailResponseEntity> getAccountDetail({
    String? sessionId,
    String? apiKey
  }) async {
    var response = await _authenticationService.getAccountDetail(
        sessionId: sessionId,
        apiKey: apiKey
    );

    return AccountDetailResponseMapper.toEntity(response);
  }
}