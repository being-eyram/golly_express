class OtpRequest {
  final String otp;
  final String resetToken;

  OtpRequest({
    required this.otp,
    required this.resetToken,
  });

  Map<String, dynamic> toJson() => {
        "otp": otp,
      };
}
