// To parse this JSON data, do
//
//     final forgotPasswordModel = forgotPasswordModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordModelFromJson(String str) =>
    ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordModelToJson(ForgotPasswordModel data) =>
    json.encode(data.toJson());

class ForgotPasswordModel {
  final ResetToken data;
  final String message;
  final String status;

  ForgotPasswordModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        data: ResetToken.fromJson(json["data"]),
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "status": status,
      };
}

class ResetToken {
  final String resetToken;

  ResetToken({
    required this.resetToken,
  });

  factory ResetToken.fromJson(Map<String, dynamic> json) => ResetToken(
        resetToken: json["reset_token"],
      );

  Map<String, dynamic> toJson() => {
        "reset_token": resetToken,
      };
}
