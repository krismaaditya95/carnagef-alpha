import 'package:carnagef_alpha/core/usecases/base_usecase.dart';
import 'package:carnagef_alpha/features/movies/data/models/authentication/account_detail_params.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/account_detail_response_entity.dart';
import 'package:carnagef_alpha/features/movies/domain/repository/authentication/authentication_repository.dart';

class AuthenticationCheckUseCase extends BaseUsecase<AccountDetailResponseEntity, AccountDetailParams>{
  final AuthenticationRepository _authenticationRepository;

  AuthenticationCheckUseCase({
    required AuthenticationRepository authenticationRepository
  }) : _authenticationRepository = authenticationRepository;

  @override
  Future<AccountDetailResponseEntity> call(AccountDetailParams params) async {
    return await _authenticationRepository.getAccountDetail(
        sessionId: params.sessionId,
        apiKey: params.apiKey
    );
  }


}