import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/extensions/field_validation.dart';

class ResetPasswordScreen extends ConsumerWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    var confirmPassword = "";

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gollyExpressLogo,
                const Text(
                  "Enter New Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Please enter your new password",
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
                const SizedBox(height: 32),
                const Divider(
                  color: Color(0xFFEDEFEE),
                  // height: 16,
                ),
                CustomButton(
                  borderRadius: 8,
                  isEnabled: true,
                  buttonText: "Reset Password",
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    // ref
                    //     .read(asyncAuthProvider.notifier)
                    //     .signupUser(userCredentials);
                  },
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
