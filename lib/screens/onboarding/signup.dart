import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/providers/providers.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

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
              //   onPressed: () => context.go("/signin"),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
          child: Column(
            children: [
              appLogo,
              const Text(
                "Register to start",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 16),
              const Text(
                "Enter your information below",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 16),
              const InputTextField(hintText: "Enter Email"),
              const SizedBox(height: 16),
              const InputTextField(hintText: "Full Name"),
              const SizedBox(height: 16),
              const InputTextField(
                hintText: "Phone Number",
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 10),
                  child: Text(
                    "+233 ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              const InputTextField(hintText: "Address"),
            ],
          ),
        ),
      ),
    );
  }
}

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
              child: const Text("Next", style: TextStyle(fontSize: 14)),
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
                  isObscured: ref.watch(showPasswordProvider),
                  suffixIconOnTap: () {
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
                  isObscured: ref.watch(showPasswordProvider),
                  suffixIconOnTap: () {
                    ref
                        .read(showPasswordProvider.notifier)
                        .update((state) => !state);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
