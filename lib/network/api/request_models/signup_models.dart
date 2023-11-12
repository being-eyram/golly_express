import '../helper/serializable.dart';

class SignUpRequestModel implements Serializable {
  SignUpRequestModel({
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.fullName,
  });

  final String email;
  final String password;
  final String phoneNumber;
  final String fullName;

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'Fullname': fullName,
    };
  }
}
