import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/extensions/field_validation.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/providers/user_data_provider.dart';

import 'auth_provider.dart';

class RegisterPasswordScreen extends ConsumerWidget {
  const RegisterPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final email = ref.watch(emailProvider);
    final fullName = ref.watch(fullNameProvider);
    final phoneNumber = ref.watch(phoneNumberProvider);
    var confirmPassword = "";

    final isLoading = ref.watch(asyncAuthProvider).isLoading;

    final userCredentials = AuthRequest(
      email: email,
      password: confirmPassword,
      fullName: fullName,
      phoneNumber: phoneNumber,
    );

    ref.listen(asyncAuthProvider, (_, signupState) {
      signupState.when(
        data: (_) => context.go('/login'),
        error: (errMessage, __) {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Error'),
              content: Text(errMessage.toString()),
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 16),
                  const Divider(
                    color: Color(0xFFEDEFEE),
                    // height: 16,
                  ),
                  CustomButton(
                    borderRadius: 8,
                    isEnabled: true,
                    buttonText: "Next",
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) return;
                      ref
                          .read(asyncAuthProvider.notifier)
                          .signupUser(userCredentials);
                    },
                  ),
                  const SizedBox(height: 50)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
