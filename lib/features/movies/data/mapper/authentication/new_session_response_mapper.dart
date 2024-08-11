import 'package:carnagef_alpha/features/movies/data/models/authentication/new_session_response_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/new_session_response_entity.dart';

/// MAPPER Class that is used to map DTO / Model Class into Entity class
/// [NewSessionResponseMapper] is used to map [NewSessionResponseModel] into [NewSessionResponseEntity]
/// -----------------------------------------------------------
class NewSessionResponseMapper {
  static NewSessionResponseEntity toEntity(NewSessionResponseModel model) => NewSessionResponseEntity(
      success: model.success,
      sessionId: model.sessionId
  );
}