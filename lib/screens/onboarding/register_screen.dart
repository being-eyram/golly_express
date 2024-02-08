import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/network/api/request_models/auth_request_models.dart';
import 'package:golly_express/shared/app_routes.dart';
import 'package:golly_express/shared/custom_input_formatters.dart';
import 'package:golly_express/shared/extensions/context_extension.dart';
import 'package:golly_express/shared/extensions/field_validation.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  late TextEditingController emailController;
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.h,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: context.height,
          padding: EdgeInsets.symmetric(horizontal: 24.w).copyWith(bottom: 100),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/golly_express.jpeg',
                      height: 91.h,
                    ),
                    Text(
                      "Register to start",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Enter your information below",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // EMAIL ADDRESS FIELD
                    InputTextField(
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      labelText: "Email Address",
                      hintText: "Enter Email",
                      validator: (value) => validateEmail(value),
                    ),
                    SizedBox(height: 30.h),

                    // FULL NAME FIELD
                    InputTextField(
                      labelText: "Full Name",
                      hintText: "Enter your full name",
                      controller: fullNameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[a-zA-Z]+|\s+|\-"),
                        ),
                        NameFormatter(),
                      ],
                      validator: (value) => validateFullName(value),
                    ),
                    SizedBox(height: 30.h),

                    // PHONE NUMBER FIELD
                    InputTextField(
                      controller: phoneNumberController,
                      validator: (value) => validatePhoneNumber(value),
                      hintText: "Phone Number",
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(
                            top: 15.h, bottom: 15.h, left: 15.w, right: 10.w),
                        child: Text(
                          "+233 ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                        LengthLimitingTextInputFormatter(9),
                        PhoneNumberInputFormatter(),
                        // PhoneNumberFormatter(),
                      ],
                    ),
                  ],
                ),

                // NEXT BUTTON
                CustomButton(
                  borderRadius: 8.r,
                  isEnabled: true,
                  buttonText: "Next",
                  onPressed: () {
                    final unmaskedPhoneNumber =
                        PhoneNumberInputFormatter.getUnmaskedValue(
                            phoneNumberController.text);
                    final phoneNumber = "0$unmaskedPhoneNumber";
                    if (formKey.currentState!.validate()) {
                      AuthRequest req = AuthRequest(
                        email: emailController.text,
                        phoneNumber: phoneNumber,
                        fullName: fullNameController.text,
                        password: "",
                      );
                      context.push(
                        AppRoutes.registerPassword,
                        extra: req,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
