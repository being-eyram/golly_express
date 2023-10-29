import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';

class SigninOptionScreen extends StatelessWidget {
  const SigninOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              borderRadius: 40,
              isEnabled: true,
              buttonText: "Login",
              onPressed: () => context.go("/login"),
            ),
            const SizedBox(height: 30),
            CustomButton(
              borderRadius: 40,
              isEnabled: true,
              buttonText: "Sign Up",
              onPressed: () => context.go("/register"),
            )
          ],
        ),
      ),
    );
  }
}
