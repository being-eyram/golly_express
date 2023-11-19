import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/extensions/field_validation.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/screens/onboarding/auth_provider.dart';

// ignore: must_be_immutable
class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final userCredentials = AuthRequest(
      email: emailController.text,
      password: passwordController.text,
    );

    final loginState = ref.watch(asyncAuthProvider);
    ref.listen(asyncAuthProvider, (previous, loginState) {
      loginState.when(
        data: (_) => context.go('/mainContainer'),
        error: (err, __) {
          final errMessage = err.toString().split(':')[1].trim();
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error'),
              content: Text(errMessage),
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
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
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
                          return validateLoginPassword(value);
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
                          final login = ref
                              .read(asyncAuthProvider.notifier)
                              .loginUser(requestBody: userCredentials);
                          // print(email);
                          // print(password);
                          print(userCredentials.toJson());

                          login;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () => context.push("/forgotPassword"),
                        style: TextButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFFF3AA60),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          const Divider(
                            color: Color(0xFFEDEFEE),
                            height: 0,
                          ),
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
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
        ),
      ),
    );
  }
}
