// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ResetPasswordRequest {
  ResetPasswordRequest({
    required this.resetToken,
    required this.password,
  });
  final String resetToken;
  final String password;

  Map<String, dynamic> toJson() => {
        "password": password,
      };

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'password': password,
  //   };
  // }

  factory ResetPasswordRequest.fromMap(Map<String, dynamic> map) {
    return ResetPasswordRequest(
      resetToken: map['resetToken'] as String,
      password: map['password'] as String,
    );
  }

  // String toJson() => json.encode(toMap());

  factory ResetPasswordRequest.fromJson(String source) =>
      ResetPasswordRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
