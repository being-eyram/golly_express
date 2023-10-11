import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/providers/providers.dart';

import '../components/input_field.dart';

class SigninScreen extends ConsumerWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                gollyExpressLogo,
                const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Lets deliver for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Register or sign and we’ll get you started. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: InputTextField(hintText: "Enter Email"),
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
                  padding: const EdgeInsets.only(top: 24.0),
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
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Divider(color: Color(0xFFEDEFEE)),
                      Container(
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(6.0),
                          child: Text("OR"),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFEDEFEE)),
                      minimumSize: const Size(double.infinity, 54),
                      maximumSize: const Size(double.infinity, 54),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        googleLogo,
                        const SizedBox(width: 8),
                        const Text(
                          "Continue with Google",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFEDEFEE)),
                      minimumSize: const Size(double.infinity, 54),
                      maximumSize: const Size(double.infinity, 54),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        appleLogo,
                        const SizedBox(width: 8),
                        const Text(
                          "Sign in with Apple",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text.rich(
                    TextSpan(
                      text: "I accept Soulpee's  ",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF454C49),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms of Use',
                            style: const TextStyle(
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print('Terms of Use"');
                              }),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Privacy Policy');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(double.infinity, 54),
                    maximumSize: const Size(double.infinity, 54),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  onPressed: () {
                    context.push('/signup');
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
