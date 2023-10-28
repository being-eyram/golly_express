import 'package:flutter_riverpod/flutter_riverpod.dart';

final usernameProvider = Provider<String>(
  (_) => "Ben-Aaron Mills-Pappoe",
);

Future<String> getProfileUsername(name) async {
  await Future.delayed(const Duration(seconds: 5));
  return name;
}

final profileNameProvider = FutureProvider<String>(
  (_) => getProfileUsername("Ben-Aaron Mills-Pappoe"),
);
