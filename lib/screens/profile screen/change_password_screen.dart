import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
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
              buttonText: "Change Password",
              isEnabled: true,
              onPressed: () {},
            )
          ],
        ),
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 24.0),
                InputTextField(
                  isPasswordInput: true,
                  hintText: "Current Password",
                ),
                SizedBox(height: 24.0),
                InputTextField(
                  isPasswordInput: true,
                  hintText: "Enter New Password",
                ),
                SizedBox(height: 24.0),
                InputTextField(
                  isPasswordInput: true,
                  hintText: "Confirm New Password",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
