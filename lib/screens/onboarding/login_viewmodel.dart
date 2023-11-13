import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/response_models/login_response.dart';
import 'package:golly_express/network/api/services/api_service.dart';

typedef AsyncLoginProvider
    = AsyncNotifierProvider<LoginNotifier, LoginResponse?>;

final asyncLoginProvider = AsyncLoginProvider(() => LoginNotifier());

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
