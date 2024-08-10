class NewSessionResponseModel {
  bool? success;
  String? sessionId;

  NewSessionResponseModel({
    this.success,
    this.sessionId});

  factory NewSessionResponseModel.fromJson(Map<String, dynamic> json) =>
    NewSessionResponseModel(
    success: json['success'] ?? false,
    sessionId: json['session_id'] ?? ""
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "session_id": sessionId
  };
}