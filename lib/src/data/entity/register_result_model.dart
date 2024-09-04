// To parse this JSON data, do
//
//     final registerResultModel = registerResultModelFromJson(jsonString);

import "dart:convert";

RegisterResultModel registerResultModelFromJson(String str) => RegisterResultModel.fromJson(json.decode(str));

String registerResultModelToJson(RegisterResultModel data) => json.encode(data.toJson());

class RegisterResultModel {
  final String? message;
  final DateTime? timestamp;

  RegisterResultModel({
    this.message,
    this.timestamp,
  });

  RegisterResultModel copyWith({
    String? message,
    DateTime? timestamp,
  }) =>
      RegisterResultModel(
        message: message ?? this.message,
        timestamp: timestamp ?? this.timestamp,
      );

  factory RegisterResultModel.fromJson(Map<String, dynamic> json) => RegisterResultModel(
        message: json["message"],
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "timestamp": timestamp?.toIso8601String(),
      };
}
