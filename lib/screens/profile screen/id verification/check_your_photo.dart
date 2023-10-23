import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/custom_button.dart';
import 'package:golly_express/constants.dart';

class CheckPhotoScreen extends StatelessWidget {
  const CheckPhotoScreen({
    super.key,
    required this.image,
  });
  final String image;
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
            TextButton(
              onPressed: () {},
              child: const Text(
                "Retake",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomButton(
              buttonText: "Use Photo",
              isEnabled: true,
              onPressed: () => context.push("/verifiedSuccess"),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  textAlign: TextAlign.center,
                  "Check your photo",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  height: 250,
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: sampleIDFront.image,
                    ),
                  ),
                ),
                // child: sampleIDFront,
                // child: Image.network(
                //     "https://myrepubliconline.com/wp-content/uploads/2021/10/Ghana-Card-1.jpg"),
                const SizedBox(height: 22),
                const Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: Color(0xFF557A46),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Is the whle document in the frame?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                const Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: Color(0xFF557A46),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Is the picture clear and not blurry?",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
