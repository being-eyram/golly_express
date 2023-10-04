import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/components/input_field.dart';

class CreateShipmentScreen extends StatelessWidget {
  const CreateShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(color: Color(0xFFEDEFEE)),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 24.0,
            ),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFE8E9E8),
                minimumSize: const Size(double.infinity, 54),
                maximumSize: const Size(double.infinity, 54),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Create Shipment",
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFFA3ADAA),
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
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
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
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
                  // InputTextField(
                  //   suffixIcon: Icon(Icons.expand_more),
                  //   hintText: "Select address",
                  // ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFEDEFEE),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "Select address",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFFA3ADAA),
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.expand_more)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  const InputTextField(
                    hintText: "Describe product",
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
