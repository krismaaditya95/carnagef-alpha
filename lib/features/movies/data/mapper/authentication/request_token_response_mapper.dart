import 'package:carnagef_alpha/features/movies/data/models/authentication/request_token_response_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/request_token_response_entity.dart';

class RequestTokenResponseMapper {
  static RequestTokenResponseEntity toEntity(RequestTokenResponseModel model) => RequestTokenResponseEntity(
      success: model.success,
      expiresAt: model.expiresAt,
      requestToken: model.requestToken
  );
}