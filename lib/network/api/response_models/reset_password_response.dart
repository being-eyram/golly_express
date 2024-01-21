import 'dart:convert';

ResetPasswordResponse resetPasswordResponseFromJson(String str) =>
    ResetPasswordResponse.fromJson(json.decode(str));

String resetPasswordResponseToJson(ResetPasswordResponse data) =>
    json.encode(data.toJson());

class ResetPasswordResponse {
  String message;
  String status;

  ResetPasswordResponse({
    required this.message,
    required this.status,
  });

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse(
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
      };
}
