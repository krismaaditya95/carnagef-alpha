import 'package:carnagef_alpha/core/constants/constants.dart';
import 'package:carnagef_alpha/core/network/data_wrapper.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/create_new_session_params.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/create_request_token_params.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/login_params.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/save_authentication_data_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/new_session_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/request_token_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/create_request_token_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/create_session_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/login_usecase.dart';
import 'package:carnagef_alpha/features/movies/domain/usecases/authentication/save_authentication_data_usecase.dart';
import 'package:carnagef_alpha/features/movies/presentation/home/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  final CreateRequestTokenUseCase _createRequestTokenUseCase;
  final LoginUseCase _loginUseCase;
  final CreateSessionUseCase _createSessionUseCase;
  final SaveAuthenticationDataUseCase _saveAuthenticationDataUseCase;

  LoginController({
    required CreateRequestTokenUseCase createRequestTokenUseCase,
    required LoginUseCase loginUseCase,
    required CreateSessionUseCase createSessionUseCase,
    required SaveAuthenticationDataUseCase saveAuthenticationDataUseCase
  }) : _createRequestTokenUseCase = createRequestTokenUseCase,
        _loginUseCase = loginUseCase,
        _createSessionUseCase = createSessionUseCase,
        _saveAuthenticationDataUseCase = saveAuthenticationDataUseCase;

  final title = "Login";
  final formKey = GlobalKey<FormState>();
  var isLoginLoading = false.obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final createRequestTokenResponseResult = Rxn<DataWrapper<RequestTokenResponseEntity>>(DataWrapper.init());
  DataWrapper<RequestTokenResponseEntity>? get getRequestTokenResponse => createRequestTokenResponseResult.value;
  RequestTokenResponseEntity get requestTokenResponseEntity => getRequestTokenResponse!.data ?? const RequestTokenResponseEntity();

  final loginResponseResult = Rxn<DataWrapper<RequestTokenResponseEntity>>(DataWrapper.init());
  DataWrapper<RequestTokenResponseEntity>? get getLoginResponse => loginResponseResult.value;
  RequestTokenResponseEntity get loginResponseEntity => getLoginResponse!.data ?? const RequestTokenResponseEntity();

  final newSessionResponseResult = Rxn<DataWrapper<NewSessionResponseEntity>>(DataWrapper.init());
  DataWrapper<NewSessionResponseEntity>? get getNewSessionResponse => newSessionResponseResult.value;
  NewSessionResponseEntity get newSessionResponseEntity => getNewSessionResponse!.data ?? const NewSessionResponseEntity();



  Future<String> createRequestToken() async {
    // response example
    // {
    // "success":true,
    // "expires_at":"2024-08-09 13:16:11 UTC",
    // "request_token":"8ff17e492ddbe868aad4d6d79ce96299f1dc6ecb"
    // }
    var requestToken = "";
    await _createRequestTokenUseCase.call(
        CreateRequestTokenParams(
          accessTokenAuth: accessTokenAuth
        )
    ).then((response){
      if(response.success == true){
        createRequestTokenResponseResult(DataWrapper.success(response));
        debugPrint('LoginController => createRequestToken|SUCCESS: ${requestTokenResponseEntity.success}');
        debugPrint('LoginController => createRequestToken|EXPIRES AT: ${requestTokenResponseEntity.expiresAt}');
        debugPrint('LoginController => createRequestToken|REQUEST TOKEN: ${requestTokenResponseEntity.requestToken}');
        requestToken = requestTokenResponseEntity.requestToken.toString();
      }
    }, onError: (error){
      // change(null, status: RxStatus.error(error.toString()));
      debugPrint('LoginController => createRequestToken|onERROR: $error');
    });
    return requestToken;
  }

  Future<void> loginUsernamePassword() async {
    isLoginLoading.value = true;

    final username = usernameController.text;
    final password = passwordController.text;

    debugPrint('LoginController => USERNAME: $username, PASSWORD: $password');

    final requestToken = await createRequestToken();
    if(requestToken != ""){
      await _loginUseCase.call(LoginParams(
        userName: username,
        passWord: password,
        requestToken: requestToken,
        accessTokenAuth: accessTokenAuth
      )).then((response) async {
        if(response.success == true){
          loginResponseResult(DataWrapper.success(response));
          debugPrint('LoginController => loginResponseResult|SUCCESS: ${loginResponseEntity.success}');
          debugPrint('LoginController => loginResponseResult|EXPIRES AT: ${loginResponseEntity.expiresAt}');
          debugPrint('LoginController => loginResponseResult|REQUEST TOKEN: ${loginResponseEntity.requestToken}');

          // =========== CREATE NEW SESSION ======================

          await _createSessionUseCase.call(CreateNewSessionParams(
              requestToken: requestToken,
              accessTokenAuth: accessTokenAuth
          )).then((response) async {
            if(response.success == true){
              newSessionResponseResult(DataWrapper.success(response));
              debugPrint('LoginController => createNewSessionResult|SUCCESS: ${newSessionResponseEntity.success}');
              debugPrint('LoginController => createNewSessionResult|SESSION_ID: ${newSessionResponseEntity.sessionId}');
              
              await _saveAuthenticationDataUseCase.call(SaveAuthenticationDataParams(
                tokenExpireDate: loginResponseEntity.expiresAt,
                requestToken: loginResponseEntity.requestToken,
                sessionId: newSessionResponseEntity.sessionId
              )).then((_){
                Get.snackbar('Login Sukses!', '',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 3),
                    colorText: Colors.black54
                );
                Get.offAllNamed(HomePage.routeName);
              });
            }
          }, onError: (error){
            debugPrint('LoginController => createNewSessionResult|onERROR: $error');
          });
          // =========== END OF CREATE NEW SESSION ===============
        }
      }, onError: (error){
        debugPrint('LoginController => loginResponseResult|onERROR: $error');
      });
    }

    isLoginLoading.value = false;
  }

  Future<void> createNewSession({String? requestToken}) async {


  }

}