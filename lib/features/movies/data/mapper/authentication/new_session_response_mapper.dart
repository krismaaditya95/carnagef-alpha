import 'package:carnagef_alpha/features/movies/data/models/authentication/new_session_response_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/new_session_response_entity.dart';

class NewSessionResponseMapper {
  static NewSessionResponseEntity toEntity(NewSessionResponseModel model) => NewSessionResponseEntity(
      success: model.success,
      sessionId: model.sessionId
  );
}