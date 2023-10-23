import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/constants.dart';
import 'package:image_picker/image_picker.dart';

class FrontIDScreen extends StatefulWidget {
  const FrontIDScreen({super.key});

  @override
  State<FrontIDScreen> createState() => _FrontIDScreenState();
}

class _FrontIDScreenState extends State<FrontIDScreen> {
  File? selectedImage;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        // reduce image size
        // maxHeight: 640,
        // maxWidth: 480,
        // imageQuality: 70,
      );
      if (image == null) return;

      final tempImage = File(image.path);
      setState(() {
        selectedImage = tempImage;
      });
    } on PlatformException catch (e) {
      print("failed to select image: $e");
    }
  }

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
              buttonText: "Open Camera",
              isEnabled: true,
              onPressed: () {
                pickImage(ImageSource.gallery);
                // context.goNamed("/checkPhoto");
              },
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  "Take a picture of the front of your Ghana Card",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  textAlign: TextAlign.center,
                  "Make sure your Ghana card is readbale and well lit. No photochopies",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 70.0),
                Center(
                  child: selectedImage == null
                      ? frontID
                      : Image.file(selectedImage!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
