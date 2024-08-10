class AccountDetailResponseModel {
  bool? success;
  num? statusCode;
  String? statusMessage;

  Avatar? avatar;
  int? id;
  String? iso6391;
  String? iso31661;
  String? name;
  bool? includeAdult;
  String? username;

  AccountDetailResponseModel({
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

  factory AccountDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      AccountDetailResponseModel(
        success: json['success'] ?? true,
        statusCode: json['status_code'] ?? 0,
        statusMessage: json['status_message'] ?? "success",
        avatar: json['avatar'] != null
            ? Avatar.fromJson(json['avatar'])
            : Avatar(),
        id: json['id'],
        iso6391: json['iso_639_1'],
        iso31661: json['iso_3166_1'],
        name: json['name'],
        includeAdult: json['include_adult'],
        username: json['username'],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status_code": statusCode,
        "status_message": statusMessage,
        "avatar": avatar,
        "id": id,
        "iso_639_1": iso6391,
        "iso_3166_1": iso31661,
        "name": name,
        "include_adult": includeAdult,
        "username": username
      };
}

class Avatar {
  Gravatar? gravatar;
  Tmdb? tmdb;

  Avatar({this.gravatar, this.tmdb});

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
      gravatar: json['gravatar'] != null
          ? Gravatar.fromJson(json['gravatar'])
          : Gravatar(),
      tmdb: json['tmdb'] != null ? Tmdb.fromJson(json['tmdb']) : Tmdb()
  );

  Map<String, dynamic> toJson() => {
    "gravatar": gravatar,
    "tmdb": tmdb
  };
}

class Gravatar {
  String? hash;

  Gravatar({this.hash});

  factory Gravatar.fromJson(Map<String, dynamic> json) => Gravatar(
      hash: json['hash'] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "hash": hash
  };
}

class Tmdb {
  String? avatarPath;

  Tmdb({this.avatarPath});

  factory Tmdb.fromJson(Map<String, dynamic> json) => Tmdb(
      avatarPath: json['avatar_path'] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "avatar_path": avatarPath
  };
}