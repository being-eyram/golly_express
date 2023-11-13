class SignupResponse {
  final Token token;
  final String message;
  final String status;

  SignupResponse({
    required this.token,
    required this.message,
    required this.status,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
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
