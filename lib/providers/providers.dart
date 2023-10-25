import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/api/services/authentication_service.dart';

final onboardingCaptionProvider = Provider<List<String>>(
  (_) => [
    "Get your package with our shipping address",
    "Package processing and notifications",
    "Product tracking and delivery"
  ],
);

final onboardingDescriptionProvider = Provider<List<String>>(
  (_) => [
    "Shop online for your favorites products and use our US shipping address at checkout for free domestic shipping offers",
    "We'll notify you when your package arrives at our US address and process your shipment.",
    "Track your shipment and receive your package in Ghana without stress."
  ],
);

final authProvider =
    StateNotifierProvider<AuthenticationService, AuthenticationState>(
        (ref) => AuthenticationService());

final showPasswordProvider = StateProvider<bool>((_) => false);
final onboardingPageIndexProvider = StateProvider<int>((_) => 0);

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
