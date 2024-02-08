import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/shared/app_routes.dart';
import 'package:golly_express/shared/extensions/context_extension.dart';
import 'package:golly_express/shared/extensions/field_validation.dart';
import 'package:golly_express/shared/utils/show_dialog.dart';

import '../../providers/auth_provider.dart';

class RegisterPasswordScreen extends ConsumerStatefulWidget {
  const RegisterPasswordScreen({
    super.key,
    required this.userCred,
  });

  final AuthRequest userCred;
  @override
  ConsumerState<RegisterPasswordScreen> createState() =>
      _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState
    extends ConsumerState<RegisterPasswordScreen> {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var confirmPassword = "";

    final showPassword = ref.watch(showPasswordProvider);
    final signupState = ref.watch(authControllerProvider); //isLoading

    ref.listen(authControllerProvider, (previous, signupState) {
      signupState.when(
        data: (_) {
          debugPrint("Account created successfully");
          successDialogg(
            context,
            content: "Account created successfully. Proceed to login page...",
            onPressed: () => context.go(AppRoutes.login),
          );
        },
        error: (error, __) {
          debugPrint("Failed to create new account");
          final errMessage = error.toString().split(':')[1].trim();
          errorDialogg(
            context,
            content: errMessage,
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
                  Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: gollyExpressLogo,
                        ),
                        const SizedBox(height: 16),
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
                          isObscured: showPassword,
                          suffixIconOnTap: () {
                            ref
                                .read(showPasswordProvider.notifier)
                                .update((state) => !state);
                          },
                        ),
                        const SizedBox(height: 24),
                        InputTextField(
                          validator: (value) =>
                              validateConfirmPassword(value, confirmPassword),
                          hintText: "Confirm Password",
                          isPasswordInput: true,
                          isObscured: showPassword,
                          suffixIconOnTap: () {
                            ref
                                .read(showPasswordProvider.notifier)
                                .update((state) => !state);
                          },
                        ),
                        const SizedBox(height: 16),
                        // const Divider(
                        //   color: Color(0xFFEDEFEE),
                        //   // height: 16,
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: CustomButton(
                      borderRadius: 8,
                      isEnabled: true,
                      isLoading: signupState.isLoading,
                      buttonText: "Next",
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) return;
                        final userCredentials = AuthRequest(
                          email: widget.userCred.email,
                          password: confirmPassword,
                          fullName: widget.userCred.fullName,
                          phoneNumber: widget.userCred.phoneNumber,
                        );
                        ref
                            .read(authControllerProvider.notifier)
                            .signupUser(userCredentials);
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
