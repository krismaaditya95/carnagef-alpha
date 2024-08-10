class DeleteSessionResponseModel {
  bool? success;

  DeleteSessionResponseModel({this.success});

  factory DeleteSessionResponseModel.fromJson(Map<String, dynamic> json) =>
      DeleteSessionResponseModel(
    success: json['success'] ?? false
  );

  Map<String, dynamic> toJson() => {
    "success": success
  };
}