class RequestTokenResponseModel {
  bool? success;
  String? expiresAt;
  String? requestToken;

  RequestTokenResponseModel({
    this.success,
    this.expiresAt,
    this.requestToken});

  factory RequestTokenResponseModel.fromJson(Map<String, dynamic> json) =>
  RequestTokenResponseModel(
    success: json['success'] ?? false,
    expiresAt: json['expires_at'] ?? "",
    requestToken: json['request_token'] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "expires_at": expiresAt,
    "request_token": requestToken
  };
}