import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/providers/onboarding_providers.dart';

enum OtpOption { sms, email }

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(selectedOtpOption.notifier).state != null;

    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: Color(0xFFEDEFEE),
          ),
          const SizedBox(
            height: 6,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
            child: CustomButton(
              borderRadius: 8,
              buttonText: "Next",
              isEnabled: isEnabled,
              onPressed: isEnabled
                  ? () {
                      // ref.watch(
                      //     forgotPasswordProvider("kelvinagbenyo@gmail.com"));
                      return context.push("/otpScreen");
                    }
                  : null,
            ),
          )
        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Forgot Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Select which contact details should we use to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                const SizedBox(height: 32),

                // OTP via SMS
                InkWell(
                  onTap: () {
                    ref.read(selectedOtpOption.notifier).state = OtpOption.sms;
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ref.watch(selectedOtpOption) == OtpOption.sms
                            ? const Color(0xFF557A46)
                            : const Color(0xFFEDEFEE),
                        width: 1.5,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Send OTP via SMS",
                          style: TextStyle(
                            color: Color(0xFFA3ADAA),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "+233 57 159 2866",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // OTP via Email
                InkWell(
                  onTap: () {
                    ref.read(selectedOtpOption.notifier).state =
                        OtpOption.email;
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: ref.watch(selectedOtpOption) == OtpOption.email
                            ? const Color(0xFF557A46)
                            : const Color(0xFFEDEFEE),
                        width: 1.5,
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Send OTP via Email",
                          style: TextStyle(
                            color: Color(0xFFA3ADAA),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
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
        ),
      ),
    );
  }
}
