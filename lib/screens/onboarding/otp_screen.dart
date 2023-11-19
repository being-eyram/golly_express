import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(color: Color(0xFFEDEFEE)),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 24.0,
              ),
              child: CustomButton(
                borderRadius: 8,
                buttonText: "Verify",
                onPressed: () {},
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
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 54),
            child: Form(
              key: formKey,
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
                              'A SMS with the verifcation PIN has been sent to ',
                          style: TextStyle(),
                        ),
                        TextSpan(
                          text: '+233 57 159 2866',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OtpField(first: true),
                      OtpField(),
                      OtpField(),
                      OtpField(
                        last: true,
                      ),
                    ],
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
          ),
        ),
      ),
    );
  }
}

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    this.first = false,
    this.last = false,
  });
  final bool? first;
  final bool? last;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 8,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "*",
          border: InputBorder.none,
          // enabledBorder: outlineBorderPropGenerator(const Color(0xFFEDEFEE)),
          enabledBorder: outlineBorderPropGenerator(const Color(0x1F000000)),
          focusedBorder: outlineBorderPropGenerator(const Color(0xFF557A46)),
        ),
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
        // textInputAction: TextInputAction.previous,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
          // } else {
          //   FocusScope.of(context).previousFocus();
          // }
        },
      ),
    );
  }
}

outlineBorderPropGenerator(Color color, {double width = 1.5}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    borderSide: BorderSide(width: width, color: color),
  );
}
