import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/providers/reset_password_provider.dart';
import 'package:golly_express/shared/app_routes.dart';
import 'package:golly_express/shared/extensions/context_extension.dart';
import 'package:golly_express/shared/extensions/field_validation.dart';
import 'package:golly_express/shared/utils/show_dialog.dart';

import '../../network/api/request_models/reset_password_request.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({
    super.key,
    required this.resetToken,
  });
  final String resetToken;

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var confirmPassword = "";

    final resetState = ref.watch(resetPasswordProvider);
    ref.listen(resetPasswordProvider, (previous, next) {
      next.when(
        data: (data) {
          debugPrint(data?.message);
          dialogg(
            context,
            barrierDismissible: false,
            icon: Icons.arrow_forward,
            title: 'Success',
            content: "Password reset successful. proceed to login.",
            onPressed: () => context.go(AppRoutes.login),
          );
        },
        error: (error, stackTrace) {
          final errMessage = error.toString().split(':')[1].trim();
          const errorMessage = "Failed to reset password. Please try again.";
          debugPrint("Error: $errMessage");

          dialogg(
            context,
            // barrierDismissible: false,
            title: 'Error',
            content: errorMessage,
            onPressed: () => context.go(AppRoutes.login),
          );
        },
        loading: () {},
      );
    });

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: context.height * .2),
                      Transform.scale(
                        scale: 1.5,
                        child: gollyExpressLogo,
                      ),
                      const SizedBox(height: 16),
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
                        hintText: "Enter New Password",
                        labelText: "Password",
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
                        labelText: "Confirm Password",
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: CustomButton(
                      borderRadius: 8,
                      isEnabled: true,
                      isLoading: resetState.isLoading,
                      buttonText: "Reset Password",
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) return;

                        final resetBody = ResetPasswordRequest(
                          resetToken: widget.resetToken,
                          password: confirmPassword,
                        );
                        ref
                            .read(resetPasswordProvider.notifier)
                            .resetPassword(requestBody: resetBody);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
