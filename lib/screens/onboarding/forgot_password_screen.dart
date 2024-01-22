import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/providers/forgot_password_provider.dart';
import 'package:golly_express/providers/onboarding_providers.dart';
import 'package:golly_express/shared/app_routes.dart';
import 'package:golly_express/shared/utils/show_dialog.dart';

enum OtpOption { sms, email }

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(selectedOtpOption.notifier).state != null;
    const email = "kelvinagbenyo@gmail.com";

    final forgotPasswordState = ref.watch(forgotPasswordProvider);
    ref.listen(forgotPasswordProvider, (previous, next) {
      next.when(
        data: (data) {
          debugPrint("OTP sent via email");
          return context.push(
            AppRoutes.otpScreen,
            extra: data!.data.resetToken,
          );
        },
        error: (err, __) {
          final errMessage = err.toString().split(':')[1].trim();
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.w,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Text(
                    "Forgot Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const Text(
                    "Select which contact details should we use to reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                  SizedBox(height: 32.h),

                  // OTP via SMS
                  InkWell(
                    onTap: () {
                      ref.read(selectedOtpOption.notifier).state =
                          OtpOption.sms;
                    },
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: ref.watch(selectedOtpOption) == OtpOption.sms
                              ? const Color(0xFF557A46)
                              : const Color(0xFFEDEFEE),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Send OTP via SMS",
                            style: TextStyle(
                              color: Color(0xFFA3ADAA),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          const Text(
                            "+233 57 159 2866",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),

                  // OTP via Email
                  InkWell(
                    onTap: () {
                      ref.read(selectedOtpOption.notifier).state =
                          OtpOption.email;
                    },
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: ref.watch(selectedOtpOption) == OtpOption.email
                              ? const Color(0xFF557A46)
                              : const Color(0xFFEDEFEE),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Send OTP via Email",
                            style: TextStyle(
                              color: Color(0xFFA3ADAA),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          const Text(
                            "benaaron866@gmail.com",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Verify Button
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  color: Color(0xFFEDEFEE),
                  height: 0,
                ),
                SizedBox(height: 6.h),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.w,
                    right: 16.w,
                    bottom: 24.h,
                  ),
                  child: CustomButton(
                    isLoading: forgotPasswordState.isLoading,
                    borderRadius: 8.r,
                    buttonText: "Next",
                    isEnabled: isEnabled,
                    onPressed: isEnabled
                        ? () async {
                            await ref
                                .read(forgotPasswordProvider.notifier)
                                .forgotPassword(email: email);
                          }
                        : () {},
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
