
import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/save_authentication_data_params.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_data_storage_repository.dart';

/// USECASE Class is used to encapsulate the specific business logic for a given use case
/// Each usecase contains only one specific task
/// Here, [SaveAuthenticationDataUseCase] interact and coordinate with [AuthenticationDataStorageRepository],
/// access its function [saveAuthenticationData] and retrieve [void] because the task is only save data to local storage
/// and didn't return any entity
/// After that, this usecase imported and used in the Controller in the Presentation Layer
/// -----------------------------------------------------------
class SaveAuthenticationDataUseCase extends BaseUsecase<void, SaveAuthenticationDataParams>{
  final AuthenticationDataStorageRepository _authenticationDataStorageRepository;

  SaveAuthenticationDataUseCase({
    required AuthenticationDataStorageRepository authenticationDataStorageRepository
  }) : _authenticationDataStorageRepository = authenticationDataStorageRepository;

  @override
  Future<void> call(SaveAuthenticationDataParams params) async {
    return await _authenticationDataStorageRepository.saveAuthenticationData(
      tokenExpireDate: params.tokenExpireDate,
      requestToken: params.requestToken,
      sessionId: params.sessionId
    );
  }
}