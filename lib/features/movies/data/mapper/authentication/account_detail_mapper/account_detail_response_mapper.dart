import 'package:carnagef_alpha/features/movies/data/models/authentication/account_detail_response_model.dart';
import 'package:carnagef_alpha/features/movies/domain/entities/authentication/account_detail_response_entity.dart';

class AccountDetailResponseMapper {
  static AccountDetailResponseEntity toEntity(AccountDetailResponseModel? model) =>
      AccountDetailResponseEntity(
          success: model!.success,
          statusCode: model.statusCode,
          statusMessage: model.statusMessage,
          avatar: AvatarMapper.toEntity(model.avatar),
          id: model.id,
          iso6391: model.iso6391,
          iso31661: model.iso31661,
          name: model.name,
          includeAdult: model.includeAdult,
          username: model.username
      );
}

class AvatarMapper {
  static AvatarEntity toEntity(Avatar? model) =>
      AvatarEntity(
        gravatar: GravatarMapper.toEntity(model?.gravatar),
        tmdb: TmdbMapper.toEntity(model?.tmdb)
      );
}

class GravatarMapper {
  static GravatarEntity toEntity(Gravatar? model) =>
      GravatarEntity(
        hash: model?.hash
      );
}

class TmdbMapper {
  static TmdbEntity toEntity(Tmdb? model) =>
      TmdbEntity(
        avatarPath: model?.avatarPath
      );
}