import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/providers/onboarding_providers.dart';
import 'package:golly_express/providers/user_data_provider.dart';

import 'auth_provider.dart';

class RegisterPasswordScreen extends ConsumerWidget {
  const RegisterPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    final email = ref.watch(emailProvider);
    final phoneNumber = ref.watch(phoneNumberProvider);
    final fullName = ref.watch(fullNameProvider);
    var confirmPassword = "";

    final signupState = ref.watch(asyncSignupProvider);

    // String? validatePassword(String value) {
    //   RegExp regex = RegExp(
    //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    //   if (value.isEmpty) {
    //     return 'Please enter password';
    //   } else {
    //     if (!regex.hasMatch(value)) {
    //       return 'Enter valid password';
    //     } else {
    //       return null;
    //     }
    //   }
    // }
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
              isLoading: signupState.isLoading,
              isEnabled: true,
              buttonText: "Next",
              onPressed: () async {
                if (!formKey.currentState!.validate()) return;
                ref.read(asyncSignupProvider.notifier).signupUser(
                      email: email,
                      fullName: fullName,
                      phoneNumber: phoneNumber,
                      password: passwordController.text,
                    );

                signupState.value?.status == 'success'
                    ? context.go('/mainContainer')
                    // : null;
                    : showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Sign up failed or smth'),
                          actions: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      );

                print(signupState.value?.status);
                print('password is $passwordController.text');
                print('email: $email');
                print('full name: $fullName');
                print('phone number: $phoneNumber');
                // print(passwordController.text);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
          child: Form(
            key: formKey,
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
                  validator: (value) {
                    confirmPassword = value;
                    return validatePassword(value);
                  },
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
                  validator: (value) {
                    if (value != confirmPassword) {
                      return "Passwords do not match";
                    }

                    if (value.isEmpty) {
                      return 'Password cannot be empty';
                    }
                    return null;
                  },
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
      ),
    );
  }
}
