import 'package:flutter/material.dart';

class MyAddressContainer extends StatelessWidget {
  const MyAddressContainer({
    super.key,
    required this.icon,
    required this.addressTitle,
    required this.addressLine,
  });

  final Icon icon;
  final String addressTitle;
  final String addressLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1.5,
          color: const Color(0xFFEDEFEE),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              // address lines
              children: [
                Row(
                  children: [
                    icon,
                    const SizedBox(width: 8),
                    Text(
                      addressTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  addressLine,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 18,
          ),
        ],
      ),
    );
  }
}
