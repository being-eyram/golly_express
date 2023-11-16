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
