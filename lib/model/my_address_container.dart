import 'package:flutter/material.dart';

class MyAddressContainer extends StatelessWidget {
  const MyAddressContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        // address lines
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFFA3ADAA),
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              // GestureDetector(
              InkWell(
                // copy text to clipboard
                onTap: () {},
                child: const Icon(Icons.copy),
              ),

              //  icon button gives unnecessary padding

              // IconButton(
              //   constraints: const BoxConstraints(),
              //   padding: const EdgeInsets.all(2),
              //   // add copy to clipboard on pressed
              //   onPressed: () {},
              //   icon: const Icon(Icons.copy),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
