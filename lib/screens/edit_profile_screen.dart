import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/components/input_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
              buttonText: "Save Changes",
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
                  "Edit Profile",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 24.0),
                InputTextField(
                  initialValue: "Ben-Aaron Mills-Pappoe",
                  hintText: "Name",
                ),
                SizedBox(height: 24.0),
                InputTextField(
                  initialValue: "benaaron866@gmail.com",
                  hintText: "Email Address",
                ),
                SizedBox(height: 24.0),
                InputTextField(
                  prefixText: "+233  ",
                  prefixStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                  initialValue: "57 159 2866",
                  hintText: "Phone Number",
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
