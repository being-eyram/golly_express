class AuthRequest {
  AuthRequest({
    required this.email,
    required this.password,
    this.phoneNumber,
    this.fullName,
  });

  final String email;
  final String password;
  final String? phoneNumber;
  final String? fullName;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'Fullname': fullName,
    };
  }
}

class LoginRequest {
  LoginRequest({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      "email": email.trim(),
      "password": password.trim(),
    };
  }
}

class SignUpRequest {
  SignUpRequest({
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.fullName,
  });

  final String email;
  final String password;
  final String phoneNumber;
  final String fullName;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'Fullname': fullName,
    };
  }
}
