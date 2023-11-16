import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/request_models/login_models.dart';
import 'package:golly_express/network/api/request_models/signup_models.dart';
import 'package:golly_express/network/api/response_models/auth_response.dart';
import 'package:golly_express/network/api/services/api_service.dart';

typedef AsyncLoginProvider = AsyncNotifierProvider<AuthNotifier, AuthResponse?>;

final asyncAuthProvider = AsyncLoginProvider(() => AuthNotifier());

// final apiServiceProvider = Provider((ref) => GollyApiService());
class AuthNotifier extends AsyncNotifier<AuthResponse?> {
  @override
  FutureOr<AuthResponse?> build() {
    return null;
  }

  Future<AuthResponse?> loginUser(String email, String password) async {
    final apiService = ref.read(apiServiceProvider);
    final requestBody = LoginRequest(email: email, password: password);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.loginUser(body: requestBody),
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
    final requestBody = SignUpRequest(
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      fullName: fullName,
    );
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.signupUser(body: requestBody),
    );

    return state.value;
  }
}
