import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/create_new_session_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/new_session_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';

/// USECASE Class is used to encapsulate the specific business logic for a given use case
/// Each usecase contains only one specific task
/// Here, [CreateSessionUseCase] interact and coordinate with [AuthenticationRepository],
/// access its function [createNewSession] and retrieve [NewSessionResponseEntity]
/// After that, this usecase imported and used in the Controller in the Presentation Layer
/// -----------------------------------------------------------
class CreateSessionUseCase extends BaseUsecase<NewSessionResponseEntity, CreateNewSessionParams>{
  final AuthenticationRepository _authenticationRepository;

  CreateSessionUseCase({
    required AuthenticationRepository authenticationRepository
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<NewSessionResponseEntity> call(CreateNewSessionParams params) async {
    return await _authenticationRepository.createNewSession(
        requestToken : params.requestToken,
        accessTokenAuth : params.accessTokenAuth
    );
  }
}