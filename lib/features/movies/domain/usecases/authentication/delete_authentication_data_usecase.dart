import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/save_authentication_data_params.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_data_storage_repository.dart';

class DeleteAuthenticationDataUseCase extends BaseUsecase<void, SaveAuthenticationDataParams>{
  final AuthenticationDataStorageRepository _authenticationDataStorageRepository;

  DeleteAuthenticationDataUseCase({
    required AuthenticationDataStorageRepository authenticationDataStorageRepository
  }) : _authenticationDataStorageRepository = authenticationDataStorageRepository;

  @override
  Future<void> call(SaveAuthenticationDataParams params) async {
    return await _authenticationDataStorageRepository.deleteAuthenticationData(
      tokenExpireDate: params.tokenExpireDate,
      requestToken: params.requestToken,
      sessionId: params.sessionId
    );
  }
}