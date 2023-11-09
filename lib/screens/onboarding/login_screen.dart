import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/providers/onboarding_providers.dart';
import 'package:golly_express/providers/user_data_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    var email = ref.watch(emailProvider);

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

    String? validatePassword(String value) {
      // Password should have at least 6 characters
      if (value.length < 6) {
        return 'Password must contain at least 6 characters';
      }

      // Password should have at least one uppercase letter
      if (!value.contains(RegExp(r'[A-Z]'))) {
        return 'Password must contain at least one uppercase letter';
      }

      // Password should have at least one lowercase letter
      if (!value.contains(RegExp(r'[a-z]'))) {
        return 'Password must contain at least one lowercase letter';
      }

      // Password should have at least one special character
      if (!value.contains(RegExp(r'[!@#\$&*~]'))) {
        return 'Password must contain at least one special character';
      }

      // Password should have at least one digit
      if (!value.contains(RegExp(r'[0-9]'))) {
        return 'Password must contain at least one digit';
      }

      // Password is valid
      return null;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  gollyExpressLogo,
                  const Text(
                    "Lets deliver for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Register or sign and we’ll get you started. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 40),
                  InputTextField(
                    validator: (value) {
                      return validateEmail(value);
                    },
                    hintText: "Enter Email",
                    initialValue: email,
                    labelText: "Email",
                  ),
                  const SizedBox(height: 16),
                  InputTextField(
                    validator: (value) {
                      return validatePassword(value);
                    },
                    labelText: "Password",
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
                  CustomButton(
                    borderRadius: 8,
                    isEnabled: true,
                    buttonText: "Submit",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.go("/mainContainer");
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  Stack(
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
                  const SizedBox(height: 16),
                  OutlinedButton(
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
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
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
                  const SizedBox(height: 24),
                  Text.rich(
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
                                // print('Terms of Use"');
                              }),
                        const TextSpan(text: ' and '),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: const TextStyle(
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // print('Privacy Policy');
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () => context.push("/register"),
              child: const Text("Sign up",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  )),
            )
            // SizedBox(
            //   width: double.infinity,
            //   height: 54,
            //   child: TextButton(
            //     style: TextButton.styleFrom(
            //       minimumSize: const Size(double.infinity, 54),
            //       maximumSize: const Size(double.infinity, 54),
            //       shape: const RoundedRectangleBorder(
            //         borderRadius: BorderRadius.all(Radius.circular(8)),
            //       ),
            //     ),
            //     onPressed: () {
            //       context.push('/register');
            //     },
            //     child: const Text(
            //       "Sign Up",
            //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
