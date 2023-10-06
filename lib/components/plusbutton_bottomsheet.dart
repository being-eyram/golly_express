import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:golly_express/constants.dart';

class PlusBottomSheet extends StatelessWidget {
  const PlusBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      // height: 350,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 5,
              width: 69,
              decoration: BoxDecoration(
                color: const Color(0xFFB5BDBB),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text(
                "Close",
                style: TextStyle(
                  color: Color(0xFFA3ADAA),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            onTap: () => context.push("/createShipment"),
            minLeadingWidth: 50,
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD4E2D4),
              ),
              child: greenCargoShipIcon,
            ),
            title: const Text(
              "Create Shipment",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            thickness: 1.5,
            height: 0,
            // color: Color(0xFFEDEFEE),
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          ListTile(
            onTap: () {},
            minLeadingWidth: 50,
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFD4E2D4),
              ),
              child: greenCalculatorIcon,
            ),
            title: const Text(
              "Calculate Estimate",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
