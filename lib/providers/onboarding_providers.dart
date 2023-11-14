import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/onboarding.dart';

final onboardingPageIndexProvider = StateProvider<int>((_) => 0);

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

final onboardingItemsProvider = Provider<List<Onboarding>>(
  (_) => [
    Onboarding(
      title: _.watch(onboardingCaptionProvider)[0],
      description: _.watch(onboardingDescriptionProvider)[0],
      backgroundColor: const Color(0xFFE6EDB7),
      backgroundImage: onboardingImage1,
    ),
    Onboarding(
      title: _.watch(onboardingCaptionProvider)[1],
      description: _.watch(onboardingDescriptionProvider)[1],
      backgroundColor: const Color(0xFFFFD9C0),
      backgroundImage: onboardingImage2,
    ),
    Onboarding(
      title: _.watch(onboardingCaptionProvider)[2],
      description: _.watch(onboardingDescriptionProvider)[2],
      backgroundColor: const Color(0xFFEDE4FF),
      backgroundImage: onboardingImage3,
    ),
  ],
);


// final validateEmailProvider = Provider<Function(String)>(
//   (_) => validateEmail(value),
// );
