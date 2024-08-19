import "dart:convert";

UserBodyModel userBodyModelFromJson(String str) => UserBodyModel.fromJson(json.decode(str));

String userBodyModelToJson(UserBodyModel data) => json.encode(data.toJson());

class UserBodyModel {
  final String? email;
  final String? password;

  UserBodyModel({
    this.email,
    this.password,
  });

  UserBodyModel copyWith({
    String? email,
    String? password,
  }) =>
      UserBodyModel(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  factory UserBodyModel.fromJson(Map<String, dynamic> json) => UserBodyModel(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
