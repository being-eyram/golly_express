import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final showPasswordProvider = StateProvider<bool>((_) => false);
final onboardingPageIndexProvider = StateProvider<int>((_) => 0 );
