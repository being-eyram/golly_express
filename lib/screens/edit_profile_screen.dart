import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';
import 'package:golly_express/extensions/string_extensions.dart';
import 'package:golly_express/providers/user_data_provider.dart';

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
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    InputTextField(
                      // initialValue: ref.watch(usernameProvider),
                      controller: nameController
                        ..text = ref.watch(nameProvider),
                      hintText: "Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    InputTextField(
                      controller: emailController
                        ..text = ref.watch(emailProvider),
                      // initialValue: "benaaron866@gmail.com",
                      hintText: "Email Address",
                    ),
                    const SizedBox(height: 24.0),
                    InputTextField(
                      controller: phoneNumberController
                        ..text = ref.watch(phoneNumberProvider),
                      prefixText: "+233  ",
                      prefixStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                      // initialValue: "57 159 2866",
                      hintText: "Phone Number",
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
