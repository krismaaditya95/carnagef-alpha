import 'package:carnagef_alpha/features/movies/data/models/general_response.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/general_entity.dart';

class GeneralResponseMapper {
  static GeneralEntity toEntity(GeneralResponse model) => GeneralEntity(
    success: model.success,
    statusCode: model.statusCode,
    statusMessage: model.statusMessage
  );
}