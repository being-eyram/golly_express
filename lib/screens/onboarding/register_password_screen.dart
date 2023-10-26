import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/providers/providers.dart';

class RegisterPasswordScreen extends ConsumerWidget {
  const RegisterPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: Color(0xFFEDEFEE),
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 14, bottom: 24.0),
            child: CustomButton(
              borderRadius: 8,
              isEnabled: true,
              buttonText: "Next",
              onPressed: () {},
              // onPressed: () => context.go("/registerPassword"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
          child: Column(
            children: [
              gollyExpressLogo,
              const Text(
                "Enter Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Choose a password to secure account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),
              InputTextField(
                hintText: "Enter Password",
                isPasswordInput: true,
                isObscured: ref.watch(showPasswordProvider),
                suffixIconOnTap: () {
                  ref
                      .read(showPasswordProvider.notifier)
                      .update((state) => !state);
                },
              ),
              const SizedBox(height: 24),
              InputTextField(
                hintText: "Confirm Password",
                isPasswordInput: true,
                isObscured: ref.watch(showPasswordProvider),
                suffixIconOnTap: () {
                  ref
                      .read(showPasswordProvider.notifier)
                      .update((state) => !state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
