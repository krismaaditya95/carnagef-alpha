import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/create_request_token_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/request_token_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';

class CreateRequestTokenUseCase extends BaseUsecase<RequestTokenResponseEntity, CreateRequestTokenParams>{
  final AuthenticationRepository _authenticationRepository;

  CreateRequestTokenUseCase({
    required AuthenticationRepository authenticationRepository
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<RequestTokenResponseEntity> call(CreateRequestTokenParams params) async {
    return await _authenticationRepository.createRequestToken(
        accessTokenAuth: params.accessTokenAuth
    );
  }
}