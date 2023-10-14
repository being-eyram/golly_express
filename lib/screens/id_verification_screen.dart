import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IDVerificationScreen extends StatelessWidget {
  const IDVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: Color(0xFFEDEFEE),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 24.0,
            ),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFE8E9E8),
                minimumSize: const Size(double.infinity, 54),
                maximumSize: const Size(double.infinity, 54),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Verify ID",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFA3ADAA),
                ),
              ),
            ),
          ),
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
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "ID Verification",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  textAlign: TextAlign.center,
                  "We need to verify your identity",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
