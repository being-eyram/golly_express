import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/network/api/services/api_service.dart';

import '../../network/api/response_models/login_response.dart';

final loginViewModelProvider = Provider<LoginViewModel>(
  (ref) {
    final apiService = ref.watch(apiServiceProvider);
    return LoginViewModel(apiService);
  },
);

class LoginViewModel {
  final GollyApiService _apiService;

  LoginViewModel(this._apiService);

  Future<LoginResponse> loginUser(String email, String password) {
    return _apiService.loginUser(
      email: email,
      password: password,
    );
  }
}
