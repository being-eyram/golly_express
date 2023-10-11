import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/constants.dart';

import '../components/input_field.dart';
import '../providers/providers.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLogo = Image.asset(
      'assets/images/golly_express.jpeg',
      width: 98,
      height: 91,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: Color(0xFFEDEFEE)),
          Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 16, bottom: 24.0),
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 54),
                maximumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child: const Text("Submit", style: TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
        child: Column(
          children: [
            appLogo,
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "Register to start",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(
                "Enter your informtion below",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: InputTextField(hintText: "Enter Email"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: InputTextField(hintText: "Full Name"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: InputTextField(hintText: "Phone Number"),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: InputTextField(hintText: "Address"),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPasswordScreen extends ConsumerWidget {
  const SignUpPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: Color(0xFFEDEFEE)),
          Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 16, bottom: 24.0),
            child: FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 54),
                maximumSize: const Size(double.infinity, 54),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              onPressed: () {},
              child: const Text("Submit", style: TextStyle(fontSize: 14)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
        child: Column(
          children: [
            gollyExpressLogo,
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(
                "Enter Password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text(
                "Choose a password to secure account",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InputTextField(
                hintText: "Enter Password",
                isPasswordInput: true,
                obscureText: ref.watch(showPasswordProvider),
                onTapObscureText: () {
                  ref
                      .read(showPasswordProvider.notifier)
                      .update((state) => !state);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InputTextField(
                hintText: "Confirm Password",
                isPasswordInput: true,
                obscureText: ref.watch(showPasswordProvider),
                onTapObscureText: () {
                  ref
                      .read(showPasswordProvider.notifier)
                      .update((state) => !state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
