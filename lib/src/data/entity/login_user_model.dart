import "dart:convert";

LoginUserModel loginUserModelFromJson(String str) => LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  final String? token;
  final DateTime? timestamp;

  LoginUserModel({
    this.token,
    this.timestamp,
  });

  LoginUserModel copyWith({
    String? token,
    DateTime? timestamp,
  }) =>
      LoginUserModel(
        token: token ?? this.token,
        timestamp: timestamp ?? this.timestamp,
      );

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
    token: json["token"],
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "timestamp": timestamp?.toIso8601String(),
  };
}
