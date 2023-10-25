import 'package:flutter/material.dart';

class Onboarding {
  Onboarding({
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.backgroundImage,
  });

  String title;
  String description;
  Color backgroundColor;
  Image backgroundImage;
}

// var onboardingScreens = [
  // Onboarding(
  //   title: titleLarge,
  //   description: description,
  //   backgroundColor: colorScheme.background,
  //   backgroundImage: backgroundImage,
  // ),
// ];
