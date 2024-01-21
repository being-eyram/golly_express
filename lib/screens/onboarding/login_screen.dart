import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/providers/auth_provider.dart';
import 'package:golly_express/shared/app_routes.dart';
import 'package:golly_express/shared/extensions/context_extension.dart';
import 'package:golly_express/shared/extensions/field_validation.dart';
import 'package:golly_express/shared/utils/show_dialog.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  static final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(asyncAuthProvider);
    ref.listen(asyncAuthProvider, (previous, loginState) {
      loginState.when(
        data: (_) => context.go(AppRoutes.mainContainer),
        error: (error, __) {
          final errMessage = error.toString().split(':')[1].trim();
          dialogg(
            context,
            title: 'Error',
            content: errMessage,
          );
        },
        loading: () {},
      );
    });

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // appBar: AppBar(surfaceTintColor: Colors.white),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: context.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                // vertical: 30.w,
                vertical: context.height * 0.05,
              ).copyWith(bottom: context.height * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        // gollyExpressLogo,
                        Image.asset(
                          'assets/images/golly_express.jpeg',
                          height: 91.h,
                        ),
                        SizedBox(height: 12.h),

                        Text(
                          "Lets deliver for you",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Register or sign and we’ll get you started. ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // Email Field
                        InputTextField(
                          validator: (value) => validateEmail(value),
                          hintText: "Enter Email",
                          controller: emailController,
                          labelText: "Email",
                        ),

                        SizedBox(height: 24.h),

                        // Password Field
                        InputTextField(
                          controller: passwordController,
                          validator: (value) => validateLoginPassword(value),
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

                        SizedBox(height: 24.h),

                        // Submit button
                        CustomButton(
                          borderRadius: 8.r,
                          isEnabled: true,
                          buttonText: "Submit",
                          isLoading: loginState.isLoading,
                          onPressed: () async {
                            if (!formKey.currentState!.validate()) return;
                            final userCredentials = AuthRequest(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            await ref
                                .read(asyncAuthProvider.notifier)
                                .loginUser(requestBody: userCredentials);
                          },
                        ),
                        SizedBox(height: 16.h),

                        // Forgot Password Button
                        TextButton(
                          onPressed: () {
                            // if (!formKey.currentState!.validate()) return;
                            // if (formKey.currentState!.validate()) {
                            // }
                            context.push(AppRoutes.forgotPassword);
                          },
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(fontSize: 13.sp),
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
                        SizedBox(height: 10.h),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Divider(
                              color: const Color(0xFFEDEFEE),
                              height: 0.h,
                            ),
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(6.0.w),
                                child: const Text("OR"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),

                        // GOOGLE BUTTON
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(14.w),
                            side: const BorderSide(color: Color(0xFFEDEFEE)),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                            ),
                          ),
                          onPressed: () =>
                              context.push(AppRoutes.resetPassword),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              googleLogo,
                              SizedBox(width: 8.w),
                              Text(
                                "Continue with Google",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),

                        // APPLE BUTTON
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.all(14.w),
                            side: const BorderSide(color: Color(0xFFEDEFEE)),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                            ),
                          ),
                          onPressed: () =>
                              context.push(AppRoutes.resetPassword),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              appleLogo,
                              SizedBox(width: 8.w),
                              Text(
                                "Sign in with Apple",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text.rich(
                          TextSpan(
                            text: "I accept Soulpee's  ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF454C49),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms of Use',
                                style: const TextStyle(
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: const TextStyle(
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 24.h),
                  TextButton(
                    onPressed: () => context.push(AppRoutes.register),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
                      ),
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
