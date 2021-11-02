// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.fullName,
    required this.email,
  });

  String fullName;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
    fullName: json["fullName"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "fullName": fullName,
    "email": email,
  };
}
