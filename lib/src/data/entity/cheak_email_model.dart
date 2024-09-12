// To parse this JSON data, do
//
//     final cheakEmailModel = cheakEmailModelFromJson(jsonString);

import "dart:convert";

CheakEmailModel cheakEmailModelFromJson(String str) => CheakEmailModel.fromJson(json.decode(str));

String cheakEmailModelToJson(CheakEmailModel data) => json.encode(data.toJson());

class CheakEmailModel {
  final String? email;
  final int? code;

  CheakEmailModel({
    this.email,
    this.code,
  });

  CheakEmailModel copyWith({
    String? email,
    int? code,
  }) =>
      CheakEmailModel(
        email: email ?? this.email,
        code: code ?? this.code,
      );

  factory CheakEmailModel.fromJson(Map<String, dynamic> json) => CheakEmailModel(
        email: json["email"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "code": code,
      };
}
