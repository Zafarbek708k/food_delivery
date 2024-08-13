import "dart:convert";

RegisterUserModel registerUserModelFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) => json.encode(data.toJson());

class RegisterUserModel {
  final String? message;
  final DateTime? timestamp;

  RegisterUserModel({
    this.message,
    this.timestamp,
  });

  RegisterUserModel copyWith({
    String? message,
    DateTime? timestamp,
  }) =>
      RegisterUserModel(
        message: message ?? this.message,
        timestamp: timestamp ?? this.timestamp,
      );

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
    message: json["message"],
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "timestamp": timestamp?.toIso8601String(),
  };
}
