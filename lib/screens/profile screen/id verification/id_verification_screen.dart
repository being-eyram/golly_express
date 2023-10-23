import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/constants.dart';

class IDVerificationScreen extends StatelessWidget {
  const IDVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 14,
          bottom: 24.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(color: Color(0xFFEDEFEE)),
            const SizedBox(
              height: 6,
            ),
            CustomButton(
              buttonText: "Verify ID",
              isEnabled: true,
              onPressed: () => context.push("/frontID"),
            )
          ],
        ),
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              // vertical: 50,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    textAlign: TextAlign.center,
                    "ID Verification",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    textAlign: TextAlign.center,
                    "We need to verify your identity",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // selectedImage,
                  userIDCard,
                  const SizedBox(height: 32),
                  const Text(
                    textAlign: TextAlign.center,
                    "We need to verify your identity before you can receive your package. Click the button below to scan your ID card or upload a picture of your ID card.",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
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
