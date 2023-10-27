import 'package:golly_express/api/helper/serializable.dart';

class LoginRequestModel implements Serializable {
  LoginRequestModel({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
  @override
  Map<String, dynamic> toMap() {
    return {
      "email": email.trim(),
      "password": password.trim(),
    };
  }
}

class LoginResponseModel {
  LoginResponseModel({
    required this.token,
    required this.error,
  });

  final String token;
  final String error;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }
}
