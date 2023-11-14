import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/extensions/field_validators.dart';
import 'package:golly_express/screens/onboarding/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final loginState = ref.watch(asyncAuthProvider);
    ref.listen(asyncAuthProvider, (previous, loginState) {
      loginState.when(
        data: (_) => context.go('/mainContainer'),
        error: (errMessage, __) {
          final errorMessage = errMessage as Exception;
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error'),
              content: Text('$errorMessage'),
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
        },
        loading: () {},
      );
    });

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
                    controller: emailController,
                    labelText: "Email",
                  ),
                  const SizedBox(height: 16),
                  InputTextField(
                    controller: passwordController,
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
                    isLoading: loginState.isLoading,
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;
                      ref.read(asyncAuthProvider.notifier).loginUser(
                            emailController.text,
                            passwordController.text,
                          );
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
          ],
        ),
      ),
    );
  }
}
