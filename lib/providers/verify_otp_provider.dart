import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/request_models/otp_request.dart';
import 'package:golly_express/network/api/response_models/otp_response.dart';
import 'package:golly_express/network/api/services/api_service.dart';

final enableButtonProvider = StateProvider((ref) => false);

typedef VerifyOtpNotifier
    = AsyncNotifierProvider<VerifyOtpController, OtpResponse?>;

final verifyOtpProvider = VerifyOtpNotifier(() => VerifyOtpController());

class VerifyOtpController extends AsyncNotifier<OtpResponse?> {
  @override
  FutureOr<OtpResponse?> build() {
    return null;
  }

  Future<OtpResponse?> verifyOtp({required OtpRequest requestBody}) async {
    final apiService = ref.read(apiServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.verifyOtp(requestBody: requestBody),
    );
    return state.value;
  }
}
