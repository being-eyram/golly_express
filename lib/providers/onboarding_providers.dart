import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/model/onboarding.dart';

final showPasswordProvider = StateProvider<bool>((_) => true);

final onboardingPageIndexProvider = StateProvider<int>((_) => 0);

// final formKeyProvider = Provider<GlobalKey<FormState>>(
//   (_) => GlobalKey<FormState>(),
// );

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

String? validateEmail(String value) {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    return 'Email cannot be empty';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid Email';
    } else {
      return null;
    }
  }
}

final validateEmailProvider = Provider<Function(String)>(
  (_) => validateEmail(value),
);
