import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/login_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/request_token_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';

class LoginUseCase extends BaseUsecase<RequestTokenResponseEntity, LoginParams>{
  final AuthenticationRepository _authenticationRepository;

  LoginUseCase({
    required AuthenticationRepository authenticationRepository
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<RequestTokenResponseEntity> call(LoginParams params) async {
    return await _authenticationRepository.validateRequestTokenWithLogin(
        userName : params.userName,
        passWord : params.passWord,
        requestToken : params.requestToken,
        accessTokenAuth : params.accessTokenAuth
    );
  }
}