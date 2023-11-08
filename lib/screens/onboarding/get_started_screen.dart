import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/providers/auth_service_provider.dart';

class GetStartedScreen extends ConsumerWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();

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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                "Sign in or Register and we’ll get you started. ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 40),
              InputTextField(
                controller: emailController,
                validator: (input) {
                  return validateEmail(input);
                },
                hintText: "Enter Email",
                labelText: "Email",
              ),
              const SizedBox(height: 24),
              CustomButton(
                borderRadius: 8,
                isEnabled: true,
                buttonText: "Submit",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref.read(emailProvider.notifier).state =
                        emailController.text;
                    context.go("/signinOption");
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
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // print('Privacy Policy');
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
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
                    context.push('/register');
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
