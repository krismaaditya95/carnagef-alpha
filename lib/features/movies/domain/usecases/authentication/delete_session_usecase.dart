import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/delete_session_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/delete_session_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';

/// USECASE Class is used to encapsulate the specific business logic for a given use case
/// Each usecase contains only one specific task
/// Here, [DeleteSessionUseCase] interact and coordinate with [AuthenticationRepository],
/// access its function [deleteSession] and retrieve [DeleteSessionResponseEntity]
/// After that, this usecase imported and used in the Controller in the Presentation Layer
/// -----------------------------------------------------------
class DeleteSessionUseCase extends BaseUsecase<DeleteSessionResponseEntity, DeleteSessionParams>{
  final AuthenticationRepository _authenticationRepository;

  DeleteSessionUseCase({
    required AuthenticationRepository authenticationRepository
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<DeleteSessionResponseEntity> call(DeleteSessionParams params) async {
    return await _authenticationRepository.deleteSession(
        sessionId : params.sessionId,
        accessTokenAuth : params.accessTokenAuth
    );
  }
}