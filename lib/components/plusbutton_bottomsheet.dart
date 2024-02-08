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
      // width: double.infinity,
      // height: 350,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(
        horizontal: 28,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 4.5, //-.5
              width: 59, //-10
              decoration: BoxDecoration(
                color: const Color(0xFFB5BDBB),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          const SizedBox(height: 16),
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
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            dense: true,
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
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(height: 12),
          const Divider(
            thickness: 1.5,
            height: 0,
            // color: Color(0xFFF6F7F6),
            color: Color(0xFFEDEFEE),
          ),
          const SizedBox(height: 12),
          ListTile(
            dense: true,
            onTap: () => context.push("/calculateEstimate"),
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
              style: TextStyle(fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
