import 'package:flutter/material.dart';
import 'package:golly_express/constants.dart';

class AddressDropdown extends StatelessWidget {
  const AddressDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1.6,
          color: const Color(0xFFEDEFEE),
        ),
      ),
      child: Row(
        children: [
          gollyExpressLogoMini,
          const SizedBox(width: 8),
          const Text(
            "Your Golly Express Address",
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          const Icon(Icons.expand_more)
        ],
      ),
    );
  }
}
