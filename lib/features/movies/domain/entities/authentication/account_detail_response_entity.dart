import 'package:equatable/equatable.dart';

class AccountDetailResponseEntity extends Equatable {
  final bool? success;
  final num? statusCode;
  final String? statusMessage;

  final AvatarEntity? avatar;
  final int? id;
  final String? iso6391;
  final String? iso31661;
  final String? name;
  final bool? includeAdult;
  final String? username;

  const AccountDetailResponseEntity({
    this.success,
    this.statusCode,
    this.statusMessage,
    this.avatar,
    this.id,
    this.iso6391,
    this.iso31661,
    this.name,
    this.includeAdult,
    this.username
  });

  @override
  List<Object?> get props => [
    success,
    statusCode,
    statusMessage,
    avatar,
    id,
    iso6391,
    iso31661,
    name,
    includeAdult,
    username
  ];
}

class AvatarEntity extends Equatable {
  final GravatarEntity? gravatar;
  final TmdbEntity? tmdb;

  const AvatarEntity({
    this.gravatar,
    this.tmdb,
  });

  @override
  List<Object?> get props => [
    gravatar,
    tmdb
  ];
}

class GravatarEntity extends Equatable {
  final String? hash;

  const GravatarEntity({this.hash});

  @override
  List<Object?> get props => [
    hash
  ];
}

class TmdbEntity extends Equatable{
  final String? avatarPath;

  const TmdbEntity({this.avatarPath});

  @override
  List<Object?> get props => [
    avatarPath
  ];
}

