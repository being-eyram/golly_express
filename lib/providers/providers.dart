import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/api/services/authentication_service.dart';

final authProvider =
    StateNotifierProvider<AuthenticationService, AuthenticationState>(
        (ref) => AuthenticationService());

final showPasswordProvider = StateProvider<bool>((_) => false);

final usernameProvider = Provider<String>(
  (_) => "Ben-Aaron Mills-Pappoe",
);

Future<String> getProfileUsername(name) async {
  await Future.delayed(const Duration(seconds: 7));
  return name;
}

final profileNameProvider = FutureProvider<String>(
  (_) => getProfileUsername("kisa"),
);
