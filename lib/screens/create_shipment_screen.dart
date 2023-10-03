import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Create Shipment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 24.0),
            ]),
          ),
        ),
      ),
    );
  }
}
