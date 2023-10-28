import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/providers/onboarding_providers.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    gollyExpressLogo,
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Lets deliver for you",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        "Register or sign and we’ll get you started. ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const InputTextField(
                      hintText: "Enter Email",
                      labelText: "Email",
                    ),
                    const SizedBox(height: 16),
                    // TextFormField(
                    //   decoration: const InputDecoration(
                    //     hintText: "Enter Name",
                    //     labelText: "Name",
                    //     // labelStyle: TextStyle(color: Colors.green),
                    //   ),
                    // ),
                    const SizedBox(height: 16),
                    InputTextField(
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
                        // if (formKey.currentState!.validate()) {
                        //   context.go("/addAddress");
                        // }
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
                    const SizedBox(height: 24),
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
              SizedBox(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
