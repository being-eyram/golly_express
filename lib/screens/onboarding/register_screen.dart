import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/constants.dart';
import 'package:golly_express/extensions/field_validation.dart';
import 'package:golly_express/providers/user_data_provider.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final fullNameController = TextEditingController();
    final phoneNumberController = TextEditingController();

    // var email = ref.watch(emailProvider);

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
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  gollyExpressLogo,
                  const Text(
                    "Register to start",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Enter your information below",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // email address
                  InputTextField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    labelText: "Email",
                    hintText: "Enter Email",

                    validator: (value) {
                      return validateEmail(value);
                    },
                  ),
                  const SizedBox(height: 20),

                  // full name
                  InputTextField(
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    labelText: "Full Name",
                    hintText: "Enter your full name",
                    controller: fullNameController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"[a-zA-Z]+|\s+|\-"),
                      )
                    ],
                    validator: (value) => validateFullName(value),
                  ),
                  const SizedBox(height: 20),

                  // phone number
                  InputTextField(
                    controller: phoneNumberController,
                    validator: (value) => validatePhoneNumber(value),
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
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                      LengthLimitingTextInputFormatter(9)
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    color: Color(0xFFEDEFEE),
                    height: 0,
                  ),
                  CustomButton(
                    borderRadius: 8,
                    isEnabled: true,
                    buttonText: "Next",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ref.read(emailProvider.notifier).state =
                            emailController.text;
                        ref.read(phoneNumberProvider.notifier).state =
                            phoneNumberController.text;
                        ref.read(fullNameProvider.notifier).state =
                            fullNameController.text;
                        context.push("/registerPassword");
                      }
                    },
                  ),
                  const SizedBox(height: 50)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
