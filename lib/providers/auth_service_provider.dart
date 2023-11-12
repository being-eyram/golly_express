import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/api/services/authentication_service.dart';

final authenticationServiceProvider = Provider<AuthenticationService>(
  (_) => AuthenticationService(),
);

final authProvider = StateNotifierProvider<AuthenticationService, AuthenticationState>(
  (_) => AuthenticationService(),
);

// final emailProvider = StateProvider<String>(
//   (ref) => "",
// );
