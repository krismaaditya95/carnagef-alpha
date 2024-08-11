import 'package:carnagef_alpha/features/movies/data/models/general_response.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';

/// MAPPER Class that is used to map DTO / Model Class into Entity class
/// [GeneralResponseMapper] is used to map [GeneralResponse] into [GeneralEntity]
/// -----------------------------------------------------------
class GeneralResponseMapper {
  static GeneralEntity toEntity(GeneralResponse model) => GeneralEntity(
    success: model.success,
    statusCode: model.statusCode,
    statusMessage: model.statusMessage
  );
}