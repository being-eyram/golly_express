import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/network/api/request_models/otp_request.dart';
import 'package:golly_express/providers/verify_otp_provider.dart';
import 'package:golly_express/shared/app_routes.dart';
import 'package:golly_express/shared/pinput_theme.dart';
import 'package:golly_express/shared/utils/show_dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({
    super.key,
    required this.resetToken,
  });
  final String resetToken;

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isEnabled = ref.watch(enableButtonProvider);

    String otp = "";

    final verifyOtpState = ref.watch(verifyOtpProvider);
    ref.listen(verifyOtpProvider, (previous, next) {
      next.when(
        loading: () {},
        data: (data) {
          debugPrint(data?.message);
          dialogg(
            context,
            barrierDismissible: false,
            icon: Icons.arrow_forward,
            title: 'Success',
            content:
                "Otp verified successfully. proceed to reset your password.",
            onPressed: () => context.go(
              AppRoutes.resetPassword,
              extra: widget.resetToken,
            ),
          );
        },
        error: (error, stackTrace) {
          final errMessage = error.toString().split(':')[1].trim();
          const errorMessage = "Failed to verify otp. Please try again.";
          debugPrint(errMessage);

          dialogg(
            context,
            barrierDismissible: false,
            title: 'Error',
            content: errorMessage,
            onPressed: () => context.go(AppRoutes.login),
          );
        },
      );
    });

    // PINPUT THEME CONFIGURATIONS
    final defaultPinTheme = PinputTheme.defaultPinTheme;
    final focusedPinTheme = PinputTheme.focusedPinTheme;
    final submittedPinTheme = PinputTheme.submittedPinTheme;

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
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ).copyWith(bottom: 0),
                child: Column(
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
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          color: Colors.black,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text:
                                'An Email with the verifcation PIN has been sent to ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'benaaron866@gmail.com',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Pinput Field
                    Pinput(
                      // obscureText: true,
                      length: 6,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.characters,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      onCompleted: (value) {
                        ref.read(enableButtonProvider.notifier).state = true;
                        otp = value;
                        final otpBody = OtpRequest(
                          otp: otp,
                          resetToken: widget.resetToken,
                        );
                        ref
                            .read(verifyOtpProvider.notifier)
                            .verifyOtp(requestBody: otpBody);
                      },

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      // closeKeyboardWhenCompleted: false,
                    ),
                    const SizedBox(height: 24),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: GoogleFonts.dmSans().fontFamily,
                          color: Colors.black,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Didn’t receive it? ',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Resend Code',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF557A46),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Verify Button
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Divider(color: Color(0xFFEDEFEE)),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 24.0,
                    ),
                    child: CustomButton(
                      isEnabled: isEnabled,
                      borderRadius: 8,
                      isLoading: verifyOtpState.isLoading,
                      buttonText: "Verify",
                      onPressed: isEnabled
                          ? () {
                              OtpRequest otpBody = OtpRequest(
                                otp: otp,
                                resetToken: widget.resetToken,
                              );
                              ref
                                  .read(verifyOtpProvider.notifier)
                                  .verifyOtp(requestBody: otpBody);
                            }
                          : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
