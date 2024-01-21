import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/response_models/reset_password_response.dart';
import 'package:golly_express/network/api/services/api_service.dart';

import '../network/api/request_models/reset_password_request.dart';

final enableButtonProvider = StateProvider((ref) => false);

typedef ResetPasswordNotifier
    = AsyncNotifierProvider<ResetPasswordController, ResetPasswordResponse?>;

final resetPasswordProvider =
    ResetPasswordNotifier(() => ResetPasswordController());

class ResetPasswordController extends AsyncNotifier<ResetPasswordResponse?> {
  @override
  FutureOr<ResetPasswordResponse?> build() {
    return null;
  }

  Future<ResetPasswordResponse?> resetPassword(
      {required ResetPasswordRequest requestBody}) async {
    final apiService = ref.read(apiServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.resetPassword(requestBody: requestBody),
    );
    return state.value;
  }
}
