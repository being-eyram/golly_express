import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/request_models/otp_request.dart';
import 'package:golly_express/network/api/services/api_service.dart';

final verifyOtpProvider =
    FutureProvider.family.autoDispose((ref, OtpRequest requestBody) async {
  final verifyOtp =
      ref.watch(apiServiceProvider).verifyOtp(requestBody: requestBody);
  return verifyOtp;
});

final enableButtonProvider = StateProvider((_) => false);

final otpProvider = StateProvider((_) => "");
