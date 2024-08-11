class RequestTokenResponseModel {
  bool? success;
  String? expiresAt;
  String? requestToken;
  num? statusCode;
  String? statusMessage;

  RequestTokenResponseModel({
    this.success,
    this.expiresAt,
    this.requestToken,
    this.statusCode,
    this.statusMessage
  });

  factory RequestTokenResponseModel.fromJson(Map<String, dynamic> json) =>
  RequestTokenResponseModel(
    success: json['success'] ?? false,
    expiresAt: json['expires_at'] ?? "",
    requestToken: json['request_token'] ?? "",
    statusCode: json['status_code'] ?? 0,
    statusMessage: json['status_message'] ?? "Empty"
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "expires_at": expiresAt,
    "request_token": requestToken,
    "status_code": statusCode,
    "status_message": statusMessage
  };
}