import 'package:carnagef_alpha/features/movies/data/models/authentication/request_token_response_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/request_token_response_entity.dart';

/// MAPPER Class that is used to map DTO / Model Class into Entity class
/// [RequestTokenResponseMapper] is used to map [RequestTokenResponseModel] into [RequestTokenResponseEntity]
/// -----------------------------------------------------------
class RequestTokenResponseMapper {
  static RequestTokenResponseEntity toEntity(RequestTokenResponseModel model) => RequestTokenResponseEntity(
      success: model.success,
      expiresAt: model.expiresAt,
      requestToken: model.requestToken,
      statusMessage: model.statusMessage,
    statusCode: model.statusCode
  );
}