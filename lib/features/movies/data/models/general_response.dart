class GeneralResponse{
  bool? success;
  num? statusCode;
  String? statusMessage;

  GeneralResponse({
    this.success,
    this.statusCode,
    this.statusMessage
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) =>
  GeneralResponse(
    success: json['success'] ?? false,
    statusCode: json['status_code'] ?? 0,
    statusMessage: json['status_message'] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "status_code": statusCode,
    "status_message": statusMessage
  };
}