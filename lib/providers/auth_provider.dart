import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/network/api/response_models/auth_response.dart';
import 'package:golly_express/network/api/services/api_service.dart';
import 'package:golly_express/shared_prefs/shared_prefs.dart';

typedef AuthNotifier
    = AutoDisposeAsyncNotifierProvider<AuthController, AuthResponse?>;

final authControllerProvider = AuthNotifier(() => AuthController());

// final apiServiceProvider = Provider((ref) => GollyApiService());
class AuthController extends AutoDisposeAsyncNotifier<AuthResponse?> {
  @override
  FutureOr<AuthResponse?> build() => null;

  Future<AuthResponse?> loginUser({required AuthRequest requestBody}) async {
    final apiService = ref.read(apiServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.loginUser(requestBody: requestBody),
    );
    await setUserBearerToken(state.value!.token.token);
    await setLoginStatus(true);
    return state.value;
  }

  Future<AuthResponse?> signupUser(AuthRequest body) async {
    final apiService = ref.read(apiServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.signupUser(requestBody: body),
    );

    return state.value;
  }
}
