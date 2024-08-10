import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/delete_session_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/delete_session_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';

class LogoutUseCase extends BaseUsecase<DeleteSessionResponseEntity, DeleteSessionParams>{
  final AuthenticationRepository _authenticationRepository;

  LogoutUseCase({
    required AuthenticationRepository authenticationRepository
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<DeleteSessionResponseEntity> call(DeleteSessionParams params) async {
    return await _authenticationRepository.deleteSession(
        sessionId: params.sessionId,
        accessTokenAuth : params.accessTokenAuth
    );
  }
}