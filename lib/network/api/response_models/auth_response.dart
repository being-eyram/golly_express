import 'dart:convert';

AuthResponse authReponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authReponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  final Token token;
  final String message;
  final String status;

  AuthResponse({
    required this.token,
    required this.message,
    required this.status,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: Token.fromJson(json['data']),
      message: json['message'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': token.toJson(),
      'message': message,
      'status': status,
    };
  }
}

class Token {
  final String token;

  Token({required this.token});

  factory Token.fromJson(
    Map<String, dynamic> json,
  ) {
    return Token(token: json['token']);
  }

  Map<String, dynamic> toJson() => {'token': token};
}
