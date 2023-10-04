import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/input_field.dart';

class CreateShipmentScreen extends StatelessWidget {
  const CreateShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // onPressed: () {
          //   Navigator.pop(context);
          // },
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Shipment",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 24.0),
                const InputTextField(
                  hintText: "Tracking number",
                ),
                const SizedBox(height: 24.0),
                const InputTextField(
                  suffixIcon: Icon(Icons.expand_more),
                  hintText: "Select address",
                ),
                const SizedBox(height: 24.0),
                const InputTextField(
                  hintText: "Describe product",
                ),
                const SizedBox(height: 24),
                Container(
                  alignment: Alignment.bottomCenter,
                  // height: 50,
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
