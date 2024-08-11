// To parse this JSON data, do
//
//     final checkOtpModel = checkOtpModelFromJson(jsonString);

import 'dart:convert';

CheckOtpModel checkOtpModelFromJson(String str) => CheckOtpModel.fromJson(json.decode(str));

String checkOtpModelToJson(CheckOtpModel data) => json.encode(data.toJson());

class CheckOtpModel {
  final String? token;
  final DateTime? timestamp;

  CheckOtpModel({
    this.token,
    this.timestamp,
  });

  CheckOtpModel copyWith({
    String? token,
    DateTime? timestamp,
  }) =>
      CheckOtpModel(
        token: token ?? this.token,
        timestamp: timestamp ?? this.timestamp,
      );

  factory CheckOtpModel.fromJson(Map<String, dynamic> json) => CheckOtpModel(
    token: json["token"],
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "timestamp": timestamp?.toIso8601String(),
  };
}
