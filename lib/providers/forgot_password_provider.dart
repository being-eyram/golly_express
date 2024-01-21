import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/response_models/forgot_password_model.dart';
import 'package:golly_express/network/api/services/api_service.dart';

typedef ForgotPasswordNotifier
    = AsyncNotifierProvider<ForgotPasswordController, ForgotPasswordModel?>;

final forgotPasswordProvider =
    ForgotPasswordNotifier(() => ForgotPasswordController());

// final apiServiceProvider = Provider((ref) => GollyApiService());
class ForgotPasswordController extends AsyncNotifier<ForgotPasswordModel?> {
  @override
  FutureOr<ForgotPasswordModel?> build() {
    return null;
  }

  Future<ForgotPasswordModel?> forgotPassword({required String email}) async {
    final apiService = ref.read(apiServiceProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () => apiService.forgotPassword(email: email),
    );
    return state.value;
  }
}
