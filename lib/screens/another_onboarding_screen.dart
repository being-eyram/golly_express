import 'package:flutter/material.dart';
import 'package:golly_express/constants.dart';

class AnotherOnboardingScreen extends StatelessWidget {
  const AnotherOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6EDB7),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 5,
            child: onboardingImage1,
          ),
        ],
      ),
    );
  }
}
