import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/shared/app_routes.dart';
import 'package:golly_express/shared/extensions/field_validation.dart';

class LoginScreenn extends ConsumerStatefulWidget {
  const LoginScreenn({super.key});

  @override
  ConsumerState<LoginScreenn> createState() => _LoginScreennState();
}

class _LoginScreennState extends ConsumerState<LoginScreenn> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // backgroundColor: Colors.blue,
      // body: Container(color: Colors.blue),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 50.h),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    gollyExpressLogo,
                    Text(
                      "Lets deliver for you",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Register or sign and we’ll get you started. ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 40.h),

                    // Email Field
                    InputTextField(
                      validator: (value) => validateEmail(value),
                      hintText: "Enter Email",
                      controller: emailController,
                      labelText: "Email",
                    ),

                    SizedBox(height: 16.h),

                    // Password Field
                    InputTextField(
                      controller: passwordController,
                      validator: (value) => validateLoginPassword(value),
                      labelText: "Password",
                      hintText: "Enter Password",
                      // isPasswordInput: true,
                      // isObscured: ref.watch(showPasswordProvider),
                      // suffixIconOnTap: () {
                      //   ref
                      //       .read(showPasswordProvider.notifier)
                      //       .update((state) => !state);
                      // },
                    ),

                    SizedBox(height: 24.h),

                    // Submit button
                    CustomButton(
                      borderRadius: 50,
                      isEnabled: true,
                      buttonText: "Submit",
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) return;
                        // final userCredentials = AuthRequest(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        // );
                        // await ref
                        //     .read(asyncAuthProvider.notifier)
                        //     .loginUser(requestBody: userCredentials);
                        // TODO: seperate login flow/login from UI
                      },
                    ),
                    SizedBox(height: 16.h),
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
                    SizedBox(height: 16.h),
                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     Divider(
                    //       color: const Color(0xFFEDEFEE),
                    //       height: 0.h,
                    //     ),
                    //     Container(
                    //       color: Colors.white,
                    //       child: Padding(
                    //         padding: EdgeInsets.all(6.0.w),
                    //         child: const Text("OR"),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // SizedBox(height: 16.h),
                    // Text.rich(
                    //   TextSpan(
                    //     text: "I accept Soulpee's  ",
                    //     style: TextStyle(
                    //       fontSize: 12.sp,
                    //       fontWeight: FontWeight.w400,
                    //       color: const Color(0xFF454C49),
                    //     ),
                    //     children: <TextSpan>[
                    //       TextSpan(
                    //         text: 'Terms of Use',
                    //         style: const TextStyle(
                    //             decoration: TextDecoration.underline),
                    //         recognizer: TapGestureRecognizer()..onTap = () {},
                    //       ),
                    //       const TextSpan(text: ' and '),
                    //       TextSpan(
                    //         text: 'Privacy Policy',
                    //         style: const TextStyle(
                    //             decoration: TextDecoration.underline),
                    //         recognizer: TapGestureRecognizer()..onTap = () {},
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              TextButton(
                onPressed: () => context.push(AppRoutes.register),
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
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
