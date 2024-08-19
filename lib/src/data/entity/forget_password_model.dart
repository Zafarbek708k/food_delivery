import "dart:convert";

ForgetPasswordModel forgetPasswordModelFromJson(String str) => ForgetPasswordModel.fromJson(json.decode(str));

String forgetPasswordModelToJson(ForgetPasswordModel data) => json.encode(data.toJson());

class ForgetPasswordModel {
  final String? message;
  final DateTime? timestamp;

  ForgetPasswordModel({
    this.message,
    this.timestamp,
  });

  ForgetPasswordModel copyWith({
    String? message,
    DateTime? timestamp,
  }) =>
      ForgetPasswordModel(
        message: message ?? this.message,
        timestamp: timestamp ?? this.timestamp,
      );

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) => ForgetPasswordModel(
    message: json["message"],
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "timestamp": timestamp?.toIso8601String(),
  };
}
