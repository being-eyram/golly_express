import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                  initialValue: "57 159 2866",
                  hintText: "Phone Number",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
