import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/providers/user_data_provider.dart';
import 'package:golly_express/shared/extensions/field_validation.dart';
import 'package:golly_express/shared/extensions/string_extensions.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneNumberController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.h,
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            top: 14.h,
            bottom: 24.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(color: Color(0xFFEDEFEE)),
              SizedBox(height: 6.h),
              CustomButton(
                buttonText: "Save Changes",
                isEnabled: true,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    ref.read(nameProvider.notifier).state =
                        nameController.text.toTitleCase();
                    ref.read(emailProvider.notifier).state =
                        emailController.text;
                    ref.read(phoneNumberProvider.notifier).state =
                        phoneNumberController.text;

                    context.pop();
                  }
                },
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // FULL NAME FIELD
                    InputTextField(
                        // initialValue: ref.watch(usernameProvider),
                        controller: nameController
                          ..text = ref.watch(nameProvider),
                        hintText: "Name",
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.allow(
                        //     RegExp(r"[a-zA-Z]+|\s"),
                        //   )
                        // ],
                        validator: (value) => validateFullName(value)),
                    SizedBox(height: 24.h),

                    // EMAIL FIELD
                    InputTextField(
                      controller: emailController
                        ..text = ref.watch(emailProvider),
                      // initialValue: "benaaron866@gmail.com",
                      hintText: "Email Address",
                    ),
                    SizedBox(height: 24.h),

                    // PHONE NUMBER FIELD
                    InputTextField(
                      controller: phoneNumberController
                        ..text = ref.watch(phoneNumberProvider),
                      prefixText: "+233  ",
                      prefixStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                      ),
                      // initialValue: "57 159 2866",
                      hintText: "Phone Number",
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r"[0-9]"),
                        )
                      ],
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
