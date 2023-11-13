import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/response_models/login_response.dart';
import 'package:golly_express/network/api/response_models/signup_response.dart';
import 'package:golly_express/network/api/services/api_service.dart';
import 'package:golly_express/providers/user_data_provider.dart';

typedef AsyncLoginProvider
    = AsyncNotifierProvider<LoginNotifier, LoginResponse?>;
typedef AsyncSignupProvider
    = AsyncNotifierProvider<SignupNotifier, SignupResponse?>;

final asyncLoginProvider = AsyncLoginProvider(() => LoginNotifier());

final asyncSignupProvider = AsyncSignupProvider(() => SignupNotifier());

class LoginNotifier extends AsyncNotifier<LoginResponse?> {
  @override
  FutureOr<LoginResponse?> build() {
    return null;
  }

  Future<LoginResponse?> loginUser(String email, String password) async {
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
}

class SignupNotifier extends AsyncNotifier<SignupResponse?> {
  @override
  FutureOr<SignupResponse?> build() {
    return null;
  }

  Future<SignupResponse?> signupUser({
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
