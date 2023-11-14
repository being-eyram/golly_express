import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/response_models/login_response.dart';
import 'package:golly_express/network/api/services/api_service.dart';

typedef AsyncLoginProvider = AsyncNotifierProvider<AuthNotifier, AuthResponse?>;

final asyncAuthProvider = AsyncLoginProvider(() => AuthNotifier());

class AuthNotifier extends AsyncNotifier<AuthResponse?> {
  @override
  FutureOr<AuthResponse?> build() {
    return null;
  }

  Future<AuthResponse?> loginUser(String email, String password) async {
    final apiService = ref.read(apiServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.loginUser(
        email: email,
        password: password,
      ),
    );
    return state.value;
  }

  Future<AuthResponse?> signupUser({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  }) async {
    final apiService = ref.read(apiServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.signupUser(
        email: email,
        password: password,
        fullName: fullName,
        phoneNumber: phoneNumber,
      ),
    );
    return state.value;
  }
}
