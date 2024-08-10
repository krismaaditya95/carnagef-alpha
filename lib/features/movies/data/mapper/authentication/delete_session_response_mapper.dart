import 'package:carnagef_alpha/features/movies/data/models/authentication/delete_session_response_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/delete_session_response_entity.dart';

class DeleteSessionResponseMapper {
  static DeleteSessionResponseEntity toEntity(DeleteSessionResponseModel model) => DeleteSessionResponseEntity(
      success: model.success
  );
}