import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/network/api/response_models/auth_response.dart';
import 'package:golly_express/network/api/services/api_service.dart';
import 'package:golly_express/shared_prefs/shared_prefs.dart';

typedef AsyncLoginProvider = AsyncNotifierProvider<AuthNotifier, AuthResponse?>;

final asyncAuthProvider = AsyncLoginProvider(() => AuthNotifier());

// final apiServiceProvider = Provider((ref) => GollyApiService());
class AuthNotifier extends AsyncNotifier<AuthResponse?> {
  @override
  FutureOr<AuthResponse?> build() {
    return null;
  }

  Future<AuthResponse?> loginUser({required AuthRequest requestBody}) async {
    final apiService = ref.read(apiServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.loginUser(requestBody: requestBody),
    );
    // ref.read(bearerTokenProvider.notifier).state = state.value?.token.token;
    await setUserBearerToken(state.value!.token.token);
    return state.value;
  }

  Future<AuthResponse?> signupUser(AuthRequest request) async {
    final apiService = ref.read(apiServiceProvider);
    final requestBody = SignUpRequest(
      email: request.email,
      password: request.password,
      phoneNumber: request.phoneNumber!,
      fullName: request.fullName!,
    );
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => apiService.signupUser(body: requestBody),
    );

    return state.value;
  }

  // Future<AuthResponse?> forgotPassword({required String email}) async {
  //   final apiService = ref.read(apiServiceProvider);
  //   state = const AsyncLoading();
  //   state = await AsyncValue.guard(
  //     () => apiService.forgotPassword(email: email),
  //   );
  //   print(state.value);
  //   return state.value;
  // }
}
