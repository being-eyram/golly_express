import 'package:flutter/material.dart';

class AddressLineContainer extends StatelessWidget {
  const AddressLineContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.showBorder = true,
  });

  final String title;
  final String subtitle;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: showBorder
            ? Border.all(
                width: 1.5,
                color: const Color(0xFFEDEFEE),
              )
            // : Border.all(
            //     width: 0,
            //     color: Colors.transparent,
            //   ),
            : const Border(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
                ],
              ),
            ],
          ),
          // const Spacer(),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.grey[400],
                  content: const Text("Copied to Clipboard"),
                  duration: const Duration(milliseconds: 200),
                ),
              );
            },
            child: const Icon(
              Icons.copy,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }
}
