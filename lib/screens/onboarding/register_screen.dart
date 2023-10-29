import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final fullNameController = TextEditingController();
    final phoneNumberController = TextEditingController();

    String? validateEmail(String value) {
      RegExp regex = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (value.isEmpty) {
        return 'Email cannot be empty';
      } else {
        if (!regex.hasMatch(value)) {
          return 'Enter valid Email';
        } else {
          return null;
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            color: Color(0xFFEDEFEE),
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16, top: 14, bottom: 24.0),
            child: CustomButton(
              borderRadius: 8,
              isEnabled: true,
              buttonText: "Next",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // final email = emailController.text;
                  // print("Valid Email");
                  context.go("/registerPassword");
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 64, right: 16, left: 16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                gollyExpressLogo,
                const Text(
                  "Register to start",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Enter your information below",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 40),

                // email address
                InputTextField(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  hintText: "Enter Email",
                  validator: (input) {
                    return validateEmail(input);
                  },
                ),
                const SizedBox(height: 20),

                // full name
                InputTextField(
                  // autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: "Full Name",
                  controller: fullNameController,
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Enter your full name";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // phone number
                InputTextField(
                  controller: phoneNumberController,
                  validator: (input) {
                    if (input.isEmpty) {
                      return "Enter your phone number";
                    }
                    return null;
                  },
                  hintText: "Phone Number",
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(
                        top: 15, bottom: 15, left: 15, right: 10),
                    child: Text(
                      "+233 ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
