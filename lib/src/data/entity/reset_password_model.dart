import "dart:convert";

ResetPasswordModel resetPasswordModelFromJson(String str) => ResetPasswordModel.fromJson(json.decode(str));

String resetPasswordModelToJson(ResetPasswordModel data) => json.encode(data.toJson());

class ResetPasswordModel {
  final String? email;
  final int? code;
  final String? newPassword;

  ResetPasswordModel({
    this.email,
    this.code,
    this.newPassword,
  });

  ResetPasswordModel copyWith({
    String? email,
    int? code,
    String? newPassword,
  }) =>
      ResetPasswordModel(
        email: email ?? this.email,
        code: code ?? this.code,
        newPassword: newPassword ?? this.newPassword,
      );

  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) => ResetPasswordModel(
    email: json["email"],
    code: json["code"],
    newPassword: json["newPassword"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "code": code,
    "newPassword": newPassword,
  };
}
